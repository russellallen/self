/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# include "abstract_interpreter_inline.hh"
# include "allocation.hh"
# include "codeSlotsMap.hh"
# include "kinds.hh"
# include "label_inline.hh"
# include "vframe.hh"
# include "vframeOop.hh"

// vframeOops (vfos for short) contain a pointer to the corresponding stack
// frame.  Unfortunately, we can't just store the frame* pointer bacause
// it is not constant (on the Sparc, the frame* is really the sp of the frame
// below our frame).
// Thus we store the halfFrame* of our activation (SPARC: sp) which is
// constant EXCEPT for the bottommost frame: if we switch to an uncommon
// branch, the frame size may change (and also the descOffset).
// Process::killVFrameOopsAndSetWatermark checks for this situation and 
// adjusts the values accordingly.


frame* vframeOopClass::fr() {
  frame* r = locals()->home_frame_of_vfo_locals();
  assert( r->is_self_frame(), "must be self frame");
  return r;
}

abstract_vframe* vframeOopClass::as_vframe() {
  assert(is_live()  ||  (lprintf("vframeOop 0x%x is dead\n", this), false),
         "not live");
  return new_vframe(fr(), descOffset());
}

void vframeOopClass::kill_vframe() {
  if (traceV) lprintf("*** killing vframeOop %#lx\n", this);
  LOG_EVENT2("killing vframe %#lx (locals = %#lx)", this, locals());
  set_locals(NULL); 
}

bool vframeOopClass::is_below(frame* fr) {
  return locals() < fr->vfo_locals_of_home_frame();
}

bool vframeOopClass::is_equal(frame* fr) {
  return locals() == fr->vfo_locals_of_home_frame();
}

bool vframeOopClass::is_above(frame* fr) {
  return locals() > fr->vfo_locals_of_home_frame();
}

#ifdef UNUSED
bool vframeOopClass::is_below(abstract_vframe* vf) {
  if (is_below(vf->fr)) return true;
  if (is_above(vf->fr)) return false;
  return descOffset() > vf->descOffset();
}
#endif

bool vframeOopClass::is_equal(abstract_vframe* vf){
  return is_equal(vf->fr) && descOffset() == vf->descOffset();
}

#ifdef UNUSED
bool vframeOopClass::is_above(abstract_vframe* vf){
  if (is_above(vf->fr)) return true;
  if (is_below(vf->fr)) return false;
  return descOffset() < vf->descOffset();
}
#endif
  

vframeOop vframeOopClass::new_senderVFrameOop(Process* p, vframeOop from, abstract_vframe* vf)
{
  vframeOop vfo;
  // vframeOops are canonical, so check first for existing vframeOop

  if (from->next() && from->next()->as_vframe()->EQ(vf)) { 
      return from->next();
  }

  MethodKind k = vf->method()->kind();
  switch (k) {
   case OuterMethodType:
    vfo = Memory->outerActivationObj->basic_clone(); break;
   case BlockMethodType:
    vfo = Memory->blockActivationObj->basic_clone(); break;
   default:
    fatal("unexpected kind");
  }
  vfo->set_process(p);
  vfo->set_locals(vf->fr->vfo_locals_of_home_frame());
  vfo->set_method(vf->method());
  vfo->set_descOffset(vf->descOffset());
    
  // Insert the new vframeOop after from
  vfo->insertAfter(from);
    
  if (p == currentProcess) {
    // make sure the current stack is updated
    p->killVFrameOopsAndSetWatermark(p->last_self_frame(true));
  }
  return vfo;
}

vframeOop vframeOopClass::new_vframeOop(Process* p, abstract_vframe* vf) {
  vframeOop vfo;
  // vframeOops are canonical, so check first for existing vframeOop
  vfo = p->findVFrameOop(vf);
  if (vfo) {
    if (traceV) lprintf("*** suppressing duplicate of vframeOop %#lx\n",
                       (long unsigned)vfo);
    return vfo;
  }

  MethodKind k = vf->method()->kind();
  switch (k) {
   case OuterMethodType:
    vfo = Memory->outerActivationObj->basic_clone(); break;
   case BlockMethodType:
    vfo = Memory->blockActivationObj->basic_clone(); break;
   default:
    fatal("unexpected kind");
  }
  vfo->set_process(p);
  vfo->set_locals(vf->fr->vfo_locals_of_home_frame());
  vfo->set_method(vf->method());
  vfo->set_descOffset(vf->descOffset());
  vfo = p->insertVFrameOop(vfo);
  if (p == currentProcess) {
    // make sure the current stack is updated
    p->killVFrameOopsAndSetWatermark(p->last_self_frame(true));
  }
  return vfo;
}

static int32 createdVFrameProtos = 0;

vframeOop vframeOopClass::create_vframeOop(oop method) {
  if (++createdVFrameProtos > 3)
    ShouldNotReachHere(); // should create only three vframe prototypes
  vframeMap *vf;
  switch (method->kind()) {
   case OuterMethodType: { ovframeMap m; vf= &m; break; }
   case BlockMethodType: { bvframeMap m; vf= &m; break; }
   default: ShouldNotReachHere();
  }
  assert(sizeof(vframeMap) == sizeof(bvframeMap) &&
         sizeof(vframeMap) == sizeof(ovframeMap), "should be the same");
  vframeOop p;
  vframeMap* m = (vframeMap*)create_map(sizeof(vframeMap), NULL, vf, (oop*)&p);
  p->set_next(NULL);
  p->set_method(method);
  p->set_locals(NULL);
  p->set_process(NULL);
  p->set_descOffset(0);
  return p;
}

bool vframeOopClass::equal(vframeOop v) {
  bool eq =
        method()     == v->method()
    &&  locals()     == v->locals()
    &&  descOffset() == v->descOffset();
  assert(!eq  ||  process() == v->process(), "should be the same");
  return eq;
}

bool vframeOopClass::verify() {
  bool flag = slotsOopClass::verify();
  if (flag && is_live()) {
    if (next() != NULL && !next()->is_vframe()) {
      error1("vframeOop %#lx: next isn't a vframeOop", this);
      flag = false;
    }
    if (!method()->has_code()) {
      error1("vframeOop %#lx: method doesn't have code", this);
      flag = false;
    }
    if (!oop(locals())->is_smi()) {
      error1("vframeOop %#lx: locals ptr isn't a smi", this);
      flag = false;
    }
    frame* f = fr();
    if (!oop(f)->is_smi()) {
      error1("vframeOop %#lx: frame ptr isn't a smi", this);
      flag = false;
    }
    if (!descOffset()->is_smi()) {
      error1("vframeOop %#lx: desc isn't a smi", this);
      flag = false;
    }
#   if defined(FAST_COMPILER) || defined(SIC_COMPILER)
      if (f->is_compiled_self_frame()) {
        nmethod* nm = f->code();
        ScopeDesc* d = nm->scopes->at(descOffset());
        if (!nm->scopes->includes(d)) {
          error1("vframeOop %#lx: desc isn't a valid scope offset", this);
          flag = false;
        }
      }
#   endif
  }
  return flag;
}
