#pragma once
/* Sun-$Revision: 30.7 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

// This file is INCLUDED into the middle of the RegisterLocator class.


# pragma interface

 private:
  oop** addresses() { return NULL; }
  
 public:
  void fix_frame(frame* f) { my_frame = f; }
