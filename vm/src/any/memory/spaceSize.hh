/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// if you change this you must also change the checks in 
// universe::check_sizes_for_snapshot
#define APPLY_TO_SPACE_SIZES(template) \
        template(eden_size)            \
        template(surv_size)            \
        template(old_size)             \
        template(code_size)            \
        template(pic_size)             \
        template(deps_size)            \
        template(debug_size)           \
        
#define SIZE_DECLARATION_TEMPLATE(s) int32 s;

class spaceSizes {
public:
  APPLY_TO_SPACE_SIZES(SIZE_DECLARATION_TEMPLATE)
  void set_from_defaults();
  void cleanup();
};

oop get_current_space_sizes_prim(oop ignored, slotsOop proto, void *FH);
oop get_default_space_sizes_prim(oop);

// mustn't cross the 512Mb boundary; can't map in there on SS-1s and 2s
const caddr_t HeapStart=        (caddr_t)(64*M);
const caddr_t NMethodStart=     (caddr_t)(400*M);
const caddr_t StubsStart=       (caddr_t)(458*M);
const caddr_t DepsStart=        (caddr_t)(474*M);
const caddr_t ScopesStart=      (caddr_t)(490*M);
const caddr_t ZoneIDStart=      (caddr_t)(506*M);
const caddr_t CountStubIDStart= (caddr_t)(508*M);
const caddr_t UseCountStart=    (caddr_t)(510*M);

extern unsigned long MaxHeapSize;
extern unsigned long MaxNMethodSize;
extern unsigned long MaxStubsSize;
extern unsigned long MaxDepsSize;
extern unsigned long MaxScopesSize;
extern unsigned long MaxZoneIDSize;
extern unsigned long MaxCountStubIDSize;
extern unsigned long MaxUseCountSize;

