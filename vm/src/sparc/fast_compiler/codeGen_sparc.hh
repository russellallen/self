/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// included into class codeGen

 private:
  inline void flushRegisterWindows();
  inline Location moveToReg(Location what, Location reg);
  
  void   smiOop_prologue(pc_t missHandler);
  void floatOop_prologue(pc_t missHandler);
  void   memOop_prologue(pc_t missHandler);


 public:
  fint getOffset(Location src, Location& baseReg);
  inline void move(Location dest, Location src, bool delay = false);
  void moveComplicated(Location dest, Location src, bool delay);
