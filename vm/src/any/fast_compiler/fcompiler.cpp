/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */


# include "codeGen.hh"
# if defined(__ppc__)
# include "codeGen_inline_ppc.hh"
# elif defined(__i386__)
# include "codeGen_inline_i386.hh"
# else
# include "codeGen_inline_sparc.hh"
# endif
# include "complexLookup.hh"
# include "fcompiler.hh"
# include "fscope.hh"
# include "itimer.hh"
# include "print.hh"
# include "registerState.hh"
# include "regs.hh"
# include "scopeDescRecorder.hh"
# include "selfMonitor.hh"
# include "slotRef.hh"
# include "timer.hh"

# ifdef FAST_COMPILER

FCompiler* theCompiler = NULL;

int32 FCompiler::verifiedOffset() { return codeGen->verifiedOffset; }
int32 FCompiler::diCheckOffset()  { return codeGen->diCheckOffset; }
int32 FCompiler::frameCreationOffset()  { return codeGen->frameCreationOffset;}
int32 FCompiler::frameSize()      { return codeGen->frameSize; }
ScopeDescRecorder* FCompiler::scopeDescRecorder() {return codeGen->scopeDescs;}
Assembler* FCompiler::instructions() { return &codeGen->a; }

FCompiler::FCompiler(compilingLookup* k, sendDesc* sd, nmln* d)
  : AbstractCompiler(k, sd, d) {
  if (VMNICProfiling) OS::profile(true);
  initialize();
}


void FCompiler::finalize() {
  theCompiler  = NULL;
  theCodeGen   = NULL;
  theAssembler = NULL;
  AbstractCompiler::finalize();
  if (VMNICProfiling) OS::profile(false);
}

void FCompiler::initialize() {
  assert(theCompiler == NULL,
         "shouldn't have but one fast compiler at a time");
  theCompiler = this;
  generateDebugCode = false;
  stackLocCount = extraArgCount = 0;
  countID = 0;
  codeGen = new CodeGen(L, send_desc, diLink);
  if (baseLookupType(L->lookupType()) == NormalBaseLookupType) {
    // ignore the receiver static bit (same nmethod covers both cases)
    L->clearReceiverStatic();
  }
  containsLoop = false;
  isImpure= false; // set to true when something is inlined
}


nmethod* FCompiler::compile() {
  EventMarker em("NIC-compiling %#lx %#lx", L->selector(), NULL);
  ElapsedTimer t(PrintCompilation || PrintCompilationStatistics);
  ShowCompileInMonitor sc(L->selector(), "NIC", false);
  // don't do any inlining when converting / single-stepping
  FlagSetting noinl(NICInlineDataAccess,
                    NICInlineDataAccess && !generateDebugCode);
  
  dispatchToCode();
  
  codeGen->scopeDescs->generate();
  if (PrintCompilationStatistics) t.stop();     // don't include nmethod alloc
  nmethod* nm = nmethod::new_nmethod(this, generateDebugCode);
  assert(theAssembler->verifyLabels(), "undefined labels");
  em.event.args[1] = nm;
  if (PrintCompilation || PrintCompilationStatistics) {
    float dt = IntervalTimer::dont_use_any_timer ? 0.0 : t.millisecs();
    if (PrintCompilation) {
      char buf[1000];
      sprintf(buf, "%#lx (%3.1f ms%s)\n", (long unsigned int)nm, dt,
              dt >= MaxCompilePause ? "!" : "");
      lprintf("%s", buf);
    }
    if (PrintCompilationStatistics) {
      lprintf("\n*NIC-time=|%2.1f| ms; to/co/sc/lo/de/bc= |%d|%d|%d|%d|%d|%d|", 
              *(void**)&dt, 
              (void*)(nm->instsLen() + nm->scopes->length() + 
                nm->locsLen() + nm->depsLen),
              (void*)nm->instsLen(), 
              (void*)nm->scopes->length(),
              (void*)nm->locsLen(), 
              (void*)nm->depsLen,
              (void*) (nm->isAccess()
                       ? 0 :
                       ((methodMap*)(nm->method()->map()))
                          ->codes()->length()));
    }
  }
  if (VerifyZoneOften) nm->verify();
  return nm;
}


void FCompiler::trace_compile(const char *s) {
  if (PrintCompilation) {
    lprintf("*NIC-compiling %s method for %s:\n",
            s, sprintName(NULL, L->selector()));
  }
}


void FCompiler::assignmentCode() {
  trace_compile("assignment");

  realSlotRef *res= L->result()->as_real();
  lookupTarget* h = res->holder;
  
  slotDesc* dataSlot = h->map()->find_slot(res->desc->name);
  realSlotRef* dataRef  = new realSlotRef(h, dataSlot);
  codeGen->assignmentCode(dataRef);

  MethodLookupKey* k= new_MethodLookupKey(L->key);
  
  ScopeInfo scope = codeGen->scopeDescs->
    addDataAssignmentScope( k,
                            new LocationName(LReceiverReg),
                            L->receiverMapOop(), 
                            methodHolder_or_map());
  codeGen->scopeDescs->addSlot(scope, 0, new LocationName(ArgLocation(0)));
}


void FCompiler::dataCode() {
  trace_compile("access");

  codeGen->prologue(true, 0);
  codeGen->lookup(Temp1, L->result()->as_real(), LReceiverReg);
  codeGen->epilogue(Temp1);

  MethodLookupKey* k= new_MethodLookupKey(L->key);
  
  (void) codeGen->scopeDescs->
    addDataAccessScope(k,
                       new LocationName(LReceiverReg),
                       L->receiverMapOop(), 
                       methodHolder_or_map());
}


void FCompiler::constantCode() {
  trace_compile("constant");

  codeGen->prologue(true, 0);
  codeGen->loadOop(Temp1, L->result()->as_real()->desc->data);
  codeGen->epilogue(Temp1);

  MethodLookupKey* k= new_MethodLookupKey(L->key);
  
  (void) codeGen->scopeDescs->
    addDataAccessScope(k,
                       new LocationName(LReceiverReg),
                       L->receiverMapOop(), 
                       methodHolder_or_map());
}


void FCompiler::methodCode() {
  trace_compile("normal");
  
  if (PrintNICSource  &&  method()  &&  method()->source() != NULL  &&  method()->source()->copy_null_terminated()) {
    lprintf( "NIC source: ");
    method()->source()->string_print();
    lprintf( "\n");
  }

  codeGen->haveStackFrame = true;
  oop slotContents= L->result()->contents();
  MethodKind kind= slotContents->kind();
  containsLoop= ((methodMap*)slotContents->map())->containsLoop();
  countID = Memory->code->nextNMethodID();
  MethodLookupKey* k= new_MethodLookupKey(L->key);
  
  FSelfScope* s;
  switch (kind) {

    case OuterMethodType:
      s = new FMethodScope(debugging, k, method(), methodHolder_or_map());
      break;

    case BlockMethodType: {
      FScope* parentScope = NULL;
      assert(ReuseNICMethods || L->receiverMap()->is_block(),
             "was expecting block");
      blockOop block = (blockOop) L->receiver;
      assert_block(block, "expecting a block literal");
      frame* parentBS = block->scope(true);
      if (parentBS) {
        // caution: parentFrame could be on conversion stack, so use
        // sending frame as a starting point
        //
        // I see that sendingVFrame can also be on conversion stack,
        //  so forget the frame hint -- dmu 1/96
        // Just to explain a bit more:
        //  for the conversion, the frames being converted are
        //  copied off the stack, and the sender is also copied.
        // So, starting with the sender is wrong, since it is not
        // on the stack, you cannot walk up the stack from it.
        // Also, the compiler wants the NEW frames anyway, so this
        // "hint" is just plain bogus. -- dmu
        
        // Guess what? Urs is here and he agrees! -- dmu 8/96

        // frame* sender =
        //  L->sendingVFrame
        //  ? L->sendingVFrame->fr
        //  : currentProcess->last_self_frame(false);

        parentVFrame = block->parentVFrame(NULL, true)->as_compiled();
        if (parentVFrame) parentScope = new_FVFrameScope(debugging, parentVFrame);
      }

      if (parentScope) {
        s = new FBlockScope(debugging, k, method(), parentScope);
      } else {
        s = new FDeadBlockScope(debugging, k, method());
      }
      break;
    }

    default:
      ShouldNotReachHere();
  }

  needRegWindowFlushes = false;

  s->genCode();
}


fint   FCompiler::incoming_arg_count() {
  return codeGen->incoming_arg_count();
}


void FCompiler::print() {
  print_short(); lprintf(":");
  L->print();
  L->result()->print();
  lprintf("\treceiver: ");
  L->receiver->print_real_oop();
  lprintf("\tcodeGen: %#lx\n",  codeGen);
}

void FCompiler::print_short() {
  lprintf("fcompiler %#lx", (unsigned long)this); }


# endif // FAST_COMPILER
