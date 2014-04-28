/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# ifdef INTERFACE_PRAGMAS
  # pragma interface
# endif


# define K 1024
# define MB (K * K)


inline  void abstract_monitor::showPaging(long how_many) { 
    char s[10];
    sprintf(s, " page%3ld", how_many);
    page->show(s);
    paging = true;
  }
  
inline void abstract_monitor::hidePaging() { 
  if (paging) { page->hide(); paging = false; }
}
