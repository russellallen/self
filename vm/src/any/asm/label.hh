/* Sun-$Revision: 30.10 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# if  defined(FAST_COMPILER) || defined(SIC_COMPILER)

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


// Labels are used by the assembler to represent the targets of branches,
// calls, etc.

extern fint currentLabelID;

extern Assembler* theAssembler; // current assembler for instructions
  
class Label: public ResourceObj {
 protected:
  char* patch;                  // instr to be patched
  char* _target;                // definition of label
  fint _id;                     // for debugging/printing
  Label* next;                  // chain of unified labels

 public:
  Label(bool isPrinting = false, char* p = 0) {
    patch = p; _target = 0; next = 0; 

#   if GENERATE_DEBUGGING_AIDS // need this either if printing or if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        isPrinting = true;
      }
#   endif
      
    if (isPrinting)
       _id = currentLabelID++;

#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        trackLabel();
      }
#   endif
  }
  ~Label()                      {
#   if GENERATE_DEBUGGING_AIDS
      if (CheckAssertions) {
        if (patch && !_target) warning("undefined label!");
        untrackLabel();
      }
#   endif
  }

  fint id()             { return _id; }
  char* target()        { return _target; }
  bool isDefined()      { return target() != 0; }

  Label* unify(Label* l);
  void define();
  void define(char* target, Label* other = 0);
  
# ifdef UNUSED
  void jump(char* p) {
    patch = p;
  }
# endif

# if GENERATE_DEBUGGING_AIDS
  void trackLabel();
  void untrackLabel();
# endif

  friend class BaseAssembler;
};

class DefinedLabel : public Label {     // label for current position
 public:
  DefinedLabel(bool isPrinting) : Label(isPrinting, 0) { define(); }
};

typedef BoundedListTemplate<Label*> LabelList;


# endif // defined(FAST_COMPILER) || defined(SIC_COMPILER)
