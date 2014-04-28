/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "diDesc.hh"
# include "_diDesc.cpp.incl"

# if defined(FAST_COMPILER) || defined(SIC_COMPILER)



void DIDesc::unlink_me() {
  dependency()->remove();
  set_jump_addr(Memory->code->trapdoors->SendDIMessage_stub_td());
  MachineCache::flush_instruction_cache_for_debugging();
}

void DIDesc::print() {
  printIndent();
  lprintf("DIDesc 0x%lx\n", this);
  Indent ++;
  printIndent();
  lprintf("addr: 0x%lx; dependency: ", jump_addr());
  dependency()->print();
  lprintf("\n");
  Indent --;
}


pc_t SendDIMessage(sendDesc* sd, frame* lookupFrame, DIDesc* dc,
                    int32 verified, oop receiver, oop arg1) {
  Unused(verified);                   
  NMethodLookupKey& k =
    nmethod::findNMethod(nmethod_from_insts((pc_t)dc))->key;
  assert(k.methodHolder_or_map() != MH_TBD,
         "should be a real method holder");
  NumberOfDILookups++;
  return dc->sendMessage(lookupFrame,
                         receiver, 
                         k.selector,
                         k.delegatee,
                         sd,
                         arg1);
}


static nmethod* SendDIMessage_cont( compilingLookup* L ) {
  if ( Interpret ) {
    L->perform_full_lookup();
    return NULL;
  }
  return L->di_desc()->lookup_compile_and_backpatch(L);
}


pc_t DIDesc::sendMessage( frame* lookupFrame,
                           oop receiver,
                           oop selector,
                           oop delegatee,
                           sendDesc* sd,
                           oop arg1 ) {
  ShowLookupInMonitor sl;
  sd->sendMessagePrologue( receiver, lookupFrame );

  ResourceMark m;
  FlushRegisterWindows(); // for vframe conversion below
  compilingLookup L( receiver,
                     selector,
                     delegatee,
                     MH_TBD,  // method holder
                     new_vframe(lookupFrame),
                     sd,
                     this,
                     false ); // don't want a debug version

  nmethod* nm = switchToVMStack(SendDIMessage_cont,  &L);
  if (SilentTrace) LOG_EVENT1("DIDesc::sendMessage: found %#lx", nm);

  return 
    Interpret
    ? L.interpretResultForCompiledSender(arg1)
    : nm->insts();
}


nmethod* DIDesc::lookup_compile_and_backpatch( compilingLookup* L ) {

  nmethod* nm= L->lookupNMethod();
  set_jump_addr(nm->insts());
  return nm;
}

# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
