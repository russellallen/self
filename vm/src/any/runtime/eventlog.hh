/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// The event log is used for debugging; it is a circular buffer containing
// the last N events.  An event is represented by an identifying string
// and up to NPARAM parameters.         -Urs

const fint NPARAM = 3;          // number of params per event

// helper macros

# define LOG_EVENT(name)           eventLog->log(name)
# define LOG_EVENT1(name,p1)       eventLog->log(name, (void*)(p1))
# define LOG_EVENT2(name,p1,p2)    eventLog->log(name, (void*)(p1),(void*)(p2))
# define LOG_EVENT3(name,p1,p2,p3) \
  eventLog->log(name, (void*)(p1), (void*)(p2), (void*)(p3))

enum EventStatus { starting, ending, atomic };

class Event /* no superclass - never allocated individually */ {       
 public:
  const char* name;                   // in lprintf format
  EventStatus status;           // for nested events
  void* args[NPARAM];
};


class EventLog  {   
 public:
  Event* buf;                   // event buffer
  Event* bufEnd;
  Event* next;                  // where the next entry will go
  int32  nesting;               // current nesting depth

  EventLog();
  void   init();

  Event* nextEvent(Event* e, Event* start, Event* endArg) {
    if (e + 1 == endArg) return start; else return e + 1; }
  Event* prevEvent(Event* e, Event* start, Event* endArg) {
    if (e == start) return endArg - 1; else return e - 1; }
  void   inc()          { next = nextEvent(next, buf, bufEnd); }

  void   log(Event* e)  { *next = *e; inc(); }
  void   log(const char* name) {
    next->name = name; next->status = atomic;
    inc(); }
  void   log(const char* name, void* p1) {
    next->name = name; next->status = atomic;
    next->args[0] = p1; inc(); }
  void   log(const char* name, void* p1, void* p2) {
    next->name = name; next->status = atomic;
    next->args[0] = p1; next->args[1] = p2; inc(); }
  void   log(const char* name, void* p1, void* p2, void* p3) {
    next->name = name; next->status = atomic;
    next->args[0] = p1; next->args[1] = p2; next->args[2] = p3; inc(); }
  
  void   resize();              // resize buffer
  
# if  GENERATE_DEBUGGING_AIDS
  void   print() { printPartial(bufEnd - buf); }
# endif
  void   printPartial(int32 n);
};

extern EventLog* eventLog;

class EventMarker : public StackObj { // for events which have a duration
 public:
  Event event;
  Event* here;

  EventMarker(const char* n)                                  { init(n, 0, 0, 0); }
  EventMarker(const char* n, void* p1)                        { init(n, p1, 0, 0); }
  EventMarker(const char* n, void* p1, void* p2)              { init(n, p1, p2, 0); }
  EventMarker(const char* n, void* p1, void* p2, void* p3)    { init(n, p1, p2, p3);}

  void init(const char* n, void* p1, void* p2, void* p3) {
    here = eventLog->next;
    eventLog->log(n, p1, p2, p3);
    here->status = starting; 
    event = *here;
    eventLog->nesting++;
  }
  ~EventMarker() {
    eventLog->nesting--;
    // optimization to make log less verbose; this isn't totally failproof
    // but that's ok
    if (here == eventLog->next - 1) {
      *here = event;
      here->status = atomic;    // nothing happened inbetween
    } else {
      event.status = ending;
      eventLog->log(&event);
    }
  }
};

oop printEvent_prim(oop rcvr, oop arg);
