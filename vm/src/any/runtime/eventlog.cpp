/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# pragma implementation "eventlog.hh"
# include "_eventlog.cpp.incl"

EventLog* eventLog;

void eventlog_init() { eventLog = new EventLog; }

static char* noEvent = "no event";

void EventLog::init() {
  buf = next = NEW_C_HEAP_ARRAY( Event, EventLogLength);
  bufEnd = buf + EventLogLength;
  for (Event* e = buf; e < bufEnd; e++) e->name = noEvent;
}

EventLog::EventLog() {
  nesting = 0;
  init();
}

void EventLog::resize() {
  Event* oldBuf = buf;
  Event* oldEnd = bufEnd;
  Event* oldNext = next;
  init();
  // copy events
  for (Event* e = nextEvent(oldNext, oldBuf, oldEnd); e != oldNext;
       e = nextEvent(e, oldBuf, oldEnd), next = nextEvent(next, buf, bufEnd)) {
    *next = *e;
  }
  FreeHeap( oldBuf); // cant use delete because this is an array -- dmu
}

void EventLog::printPartial(int32 n) {
  Event* e = next;
  // find starting point
  if (n >= EventLogLength) n = EventLogLength - 1;
  int32 i;
  for (i = 0; i < n; i++, e = prevEvent(e, buf, bufEnd)) ;
  
  // skip empty entries
  for (i = 0;  e != next && e->name == noEvent; i++, e = nextEvent(e, buf, bufEnd)) ;

  int32 indent = 0;
  lprintf("Printing events from earliest to most recent:\n");
  for (; i < n && e != next; i++, e = nextEvent(e, buf, bufEnd)) {
    char* s;
    switch (e->status) {
     case starting: s = "{ "; break;
     case ending:   s = "} "; indent--; break;
     case atomic:   s = "= "; break;
    }
    lprintf("%*s%s", (void*)(2*indent), " ", s);
    lprintf(e->name, e->args[0], e->args[1], e->args[2]);
    lprintf("\n");
    if (e->status == starting) indent++;
  }
  if (indent != nesting)
    lprintf("Actual event nesting is %ld greater than shown.\n",
           (void*)long(nesting - indent));
}
    
oop printEvent_prim(oop rcvr, oop arg) {
  if (!arg->is_smi()) return VMString[BADTYPEERROR];
  eventLog->printPartial(smiOop(arg)->value());
  return rcvr;
}
