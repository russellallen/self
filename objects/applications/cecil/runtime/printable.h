/* Sun-$Revision: 9.1 $ */

# ifndef printable_h
# define printable_h

# pragma interface

struct Printable {
  virtual void print();
  virtual void printShort();
  void printZero();
  void printShortZero();
};

extern "C" {
  void pp(void* p);
  void pp_short(void* p);
}

# endif

