/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "processMap.hh"
# include "_processMap.cpp.incl"

processOop processMap::create_process(Process* process) {
  slotList* slots = new slotList(VMString[PARENT],
                                 parent_map_slotType,
                                 create_slots((slotList*)NULL));
  processMap mm;
  processOop mr;
  (void)create_map(sizeof(processMap), slots, &mm, (oop*)&mr);
  mm.dummy_initialize(mr, smiOop_zero); // for verify
  mr = processOop(mr->clone()); // clone for processOops inits them
  mr->set_process(process);
  return mr;
}

oop processMap::clone(oop obj, bool mustAllocate, oop genObj) {
  processOop p= processOop(slotsMapDeps::clone(obj, mustAllocate, genObj));
  vframeOop m= Memory->outerActivationObj->basic_clone(mustAllocate, genObj);
  if (oop(p) != failedAllocationOop  &&  oop(m) != failedAllocationOop) {
    assert(!m->is_live(), "shouldn't be live");
    assert(m->next() == NULL, "should be empty");
    Memory->store((oop*)&p->addr()->_vframeList, m);
    p->set_return_oop(smiOop_zero);
  }
  return p;
}

oop processMap::cloneSize(oop obj, fint length, bool mustAllocate,
                          oop filler) {
  return slotsMapDeps::cloneSize(obj, length, mustAllocate, filler); }

fint processMap::empty_object_size() {
  return sizeof(processOopClass) / oopSize; 
}

void processMap::kill(oop p)    { processOop(p)->kill_process(); }
bool processMap::is_live(oop p) { return processOop(p)->is_live_process(); }


// If process is alive, so are stacks etc.
void processMap::gc_mark_contents(oop p) {
  processOop procObj= processOop(p);
  assert(procObj->is_forwarded(), "otherwise how did we get here?");
  Process *proc= procObj->process();
  if (proc == NULL // not a live process
      || proc == currentProcess || proc == twainsProcess) // already done
    return;
  if (proc->processObj() == procObj) // not a clone
    proc->gc_mark_contents();
}

void processMap::print(oop obj) {
  lprintf("process ");
  if (WizardMode && !obj->is_map())
    lprintf("%#lx ", processOop(obj)->process());
  slotsMapDeps::print(obj);
}

void processMap::switch_pointer(oop obj, oop* where, oop to) {
  assert_process(obj, "obj must be process");
  processOop(obj)->switch_return_oop(where, to);
  slotsMapDeps::switch_pointer(obj, where, to);
}

void processMap::dummy_initialize(oop obj, oop filler) {
  assert_process(obj, "obj must be process");
  processOop(obj)->set_process(NULL);
  Memory->store((oop*)&processOop(obj)->addr()->_vframeList, filler);  
  Memory->store((oop*)&processOop(obj)->addr()->_return_oop, filler);  
}
