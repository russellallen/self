/* Sun-$Revision: 30.9 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

# pragma implementation "scanner.hh"
# include "_scanner.cpp.incl"

unsigned char c_type[] = {
  /* EOF  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^@  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^A  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^B  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^C  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^D  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^E  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^F  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^G  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^H  */  _O | _O | _O | _O | _O | _O | _O,
  /*  \t  */  _O | _O | _O | _O | _S | _O | _O,
  /*  \n  */  _O | _O | _O | _O | _S | _O | _O,
  /*  ^K  */  _O | _O | _O | _O | _O | _O | _O,
  /*  \f  */  _O | _O | _O | _O | _S | _O | _O,
  /*  \r  */  _O | _O | _O | _O | _S | _O | _O,
  /*  ^N  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^O  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^P  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^Q  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^R  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^S  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^T  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^U  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^V  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^W  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^X  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^Y  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^Z  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^[  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^\  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^]  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^^  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^_  */  _O | _O | _O | _O | _O | _O | _O,
  /*     */  _O | _O | _O | _O | _S | _O | _O,
  /*  !  */  _O | _O | _O | _O | _O | _P | _O,
  /*  "  */  _O | _O | _O | _O | _O | _O | _O,
  /*  #  */  _O | _O | _O | _O | _O | _P | _O,
  /*  $  */  _O | _O | _O | _O | _O | _P | _O,
  /*  %  */  _O | _O | _O | _O | _O | _P | _O,
  /*  &  */  _O | _O | _O | _O | _O | _P | _O,
  /*  '  */  _O | _O | _O | _O | _O | _O | _O,
  /*  (  */  _O | _O | _O | _O | _O | _O | _O,
  /*  )  */  _O | _O | _O | _O | _O | _O | _O,
  /*  *  */  _O | _O | _O | _O | _O | _P | _O,
  /*  +  */  _O | _O | _O | _O | _O | _P | _O,
  /*  ,  */  _O | _O | _O | _O | _O | _P | _O,
  /*  -  */  _O | _O | _O | _O | _O | _P | _O,
  /*  .  */  _O | _O | _O | _O | _O | _O | _O,
  /*  /  */  _O | _O | _O | _O | _O | _P | _O,
  /*  0  */  _O | _O | _O | _N | _O | _O | _X,
  /*  1  */  _O | _O | _O | _N | _O | _O | _X,
  /*  2  */  _O | _O | _O | _N | _O | _O | _X,
  /*  3  */  _O | _O | _O | _N | _O | _O | _X,
  /*  4  */  _O | _O | _O | _N | _O | _O | _X,
  /*  5  */  _O | _O | _O | _N | _O | _O | _X,
  /*  6  */  _O | _O | _O | _N | _O | _O | _X,
  /*  7  */  _O | _O | _O | _N | _O | _O | _X,
  /*  8  */  _O | _O | _O | _N | _O | _O | _X,
  /*  9  */  _O | _O | _O | _N | _O | _O | _X,
  /*  :  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ;  */  _O | _O | _O | _O | _O | _P | _O,
  /*  <  */  _O | _O | _O | _O | _O | _P | _O,
  /*  =  */  _O | _O | _O | _O | _O | _P | _O,
  /*  >  */  _O | _O | _O | _O | _O | _P | _O,
  /*  ?  */  _O | _O | _O | _O | _O | _P | _O,
  /*  @  */  _O | _O | _O | _O | _O | _P | _O,
  /*  A  */  _U | _O | _A | _O | _O | _O | _X,
  /*  B  */  _U | _O | _A | _O | _O | _O | _X,
  /*  C  */  _U | _O | _A | _O | _O | _O | _X,
  /*  D  */  _U | _O | _A | _O | _O | _O | _X,
  /*  E  */  _U | _O | _A | _O | _O | _O | _X,
  /*  F  */  _U | _O | _A | _O | _O | _O | _X,
  /*  G  */  _U | _O | _A | _O | _O | _O | _O,
  /*  H  */  _U | _O | _A | _O | _O | _O | _O,
  /*  I  */  _U | _O | _A | _O | _O | _O | _O,
  /*  J  */  _U | _O | _A | _O | _O | _O | _O,
  /*  K  */  _U | _O | _A | _O | _O | _O | _O,
  /*  L  */  _U | _O | _A | _O | _O | _O | _O,
  /*  M  */  _U | _O | _A | _O | _O | _O | _O,
  /*  N  */  _U | _O | _A | _O | _O | _O | _O,
  /*  O  */  _U | _O | _A | _O | _O | _O | _O,
  /*  P  */  _U | _O | _A | _O | _O | _O | _O,
  /*  Q  */  _U | _O | _A | _O | _O | _O | _O,
  /*  R  */  _U | _O | _A | _O | _O | _O | _O,
  /*  S  */  _U | _O | _A | _O | _O | _O | _O,
  /*  T  */  _U | _O | _A | _O | _O | _O | _O,
  /*  U  */  _U | _O | _A | _O | _O | _O | _O,
  /*  V  */  _U | _O | _A | _O | _O | _O | _O,
  /*  W  */  _U | _O | _A | _O | _O | _O | _O,
  /*  X  */  _U | _O | _A | _O | _O | _O | _O,
  /*  Y  */  _U | _O | _A | _O | _O | _O | _O,
  /*  Z  */  _U | _O | _A | _O | _O | _O | _O,
  /*  [  */  _O | _O | _O | _O | _O | _O | _O,
  /*  \  */  _O | _O | _O | _O | _O | _P | _O,
  /*  ]  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ^  */  _O | _O | _O | _O | _O | _P | _O,
  /*  _  */  _O | _O | _A | _O | _O | _O | _O,
  /*  `  */  _O | _O | _O | _O | _O | _P | _O,
  /*  a  */  _O | _L | _A | _O | _O | _O | _X,
  /*  b  */  _O | _L | _A | _O | _O | _O | _X,
  /*  c  */  _O | _L | _A | _O | _O | _O | _X,
  /*  d  */  _O | _L | _A | _O | _O | _O | _X,
  /*  e  */  _O | _L | _A | _O | _O | _O | _X,
  /*  f  */  _O | _L | _A | _O | _O | _O | _X,
  /*  g  */  _O | _L | _A | _O | _O | _O | _O,
  /*  h  */  _O | _L | _A | _O | _O | _O | _O,
  /*  i  */  _O | _L | _A | _O | _O | _O | _O,
  /*  j  */  _O | _L | _A | _O | _O | _O | _O,
  /*  k  */  _O | _L | _A | _O | _O | _O | _O,
  /*  l  */  _O | _L | _A | _O | _O | _O | _O,
  /*  m  */  _O | _L | _A | _O | _O | _O | _O,
  /*  n  */  _O | _L | _A | _O | _O | _O | _O,
  /*  o  */  _O | _L | _A | _O | _O | _O | _O,
  /*  p  */  _O | _L | _A | _O | _O | _O | _O,
  /*  q  */  _O | _L | _A | _O | _O | _O | _O,
  /*  r  */  _O | _L | _A | _O | _O | _O | _O,
  /*  s  */  _O | _L | _A | _O | _O | _O | _O,
  /*  t  */  _O | _L | _A | _O | _O | _O | _O,
  /*  u  */  _O | _L | _A | _O | _O | _O | _O,
  /*  v  */  _O | _L | _A | _O | _O | _O | _O,
  /*  w  */  _O | _L | _A | _O | _O | _O | _O,
  /*  x  */  _O | _L | _A | _O | _O | _O | _O,
  /*  y  */  _O | _L | _A | _O | _O | _O | _O,
  /*  z  */  _O | _L | _A | _O | _O | _O | _O,
  /*  {  */  _O | _O | _O | _O | _O | _O | _O,
  /*  |  */  _O | _O | _O | _O | _O | _P | _O,
  /*  }  */  _O | _O | _O | _O | _O | _O | _O,
  /*  ~  */  _O | _O | _O | _O | _O | _P | _O,
  /*  ^?  */ _O | _O | _O | _O | _O | _O | _O,
  /*  M-^@  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^A  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^B  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^C  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^D  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^E  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^F  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^G  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^H  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^I  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^J  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^K  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^L  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^M  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^N  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^O  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^P  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^Q  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^R  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^S  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^T  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^U  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^V  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^W  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^X  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^Y  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^Z  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^[  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^\  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^]  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^^  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^_  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-   */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-!  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-"  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-#  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-$  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-%  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-&  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-'  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-(  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-)  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-*  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-+  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-,  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M--  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-.  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-/  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-0  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-1  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-2  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-3  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-4  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-5  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-6  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-7  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-8  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-9  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-:  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-;  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-<  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-=  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M->  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-?  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-@  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-A  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-B  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-C  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-D  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-E  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-F  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-G  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-H  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-I  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-J  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-K  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-L  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-M  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-N  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-O  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-P  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-Q  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-R  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-S  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-T  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-U  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-V  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-W  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-X  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-Y  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-Z  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-[  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-\  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-]  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-_  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-`  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-a  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-b  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-c  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-d  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-e  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-f  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-g  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-h  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-i  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-j  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-k  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-l  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-m  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-n  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-o  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-p  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-q  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-r  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-s  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-t  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-u  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-v  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-w  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-x  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-y  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-z  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-{  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-|  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-}  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-~  */  _O | _O | _O | _O | _O | _O | _O,
  /*  M-^? */  _O | _O | _O | _O | _O | _O | _O,
};

DO_NOT_CROSS_COMPILE
  
// upped this size to read in long addSlots string in modules part of
//   xlib_wrappers -- dmu 3/93
  const int32 ScannerBufferSize = 50 * K;
  static char buffer[ScannerBufferSize];

InteractiveScanner *VMScanner;

// C++ 2.0 complains about assigning a char to a TokenType--
//  and it's right!  I think it's dangerous, but rather than redo it now,
//  I will put in as_TokenType so we can find it later.  dmu 7/91

inline Token::TokenType as_TokenType(char c) {
  # if !GCC3 // compiler warns that this will never fail
    assert((unsigned)c <= (unsigned)Token::LAST_CHAR, "TokenType clash!");
  # endif
  return Token::TokenType(c);
}


inline fint asnum(fint c) {
  return is_digit(c) ? c - '0' : is_lower(c) ? c - 'a' + 10 : c - 'A' + 10;
}


SourceBuffer::SourceBuffer(FILE* source_file) {
  if (!source_file) return;
  // Find the size of the file
  if (fseek(source_file, 0, 2) < 0) {
    perror("seek failed");
    fatal("cannot seek in file");
  }
  length =  ftell(source_file);
  rewind(source_file);
  
  first = OS::map_or_read_source_file(source_file, length);

  next = (char*) first;
  last = (char*) (first + length);
  
  Files->closeFile(source_file);
} 


FileScanner::~FileScanner() {
  if (!fileError) {
    OS::unmap_source_file((caddr_t) sourceBuf->first, sourceBuf->length);
  }
}


void Scanner::initialize() {
  initSourcePos();
  commentsOK = 0;
  commentList = new TokenList(100);
  suppress = false;
}

Scanner::Scanner() {
  sourceBuf= NULL;
  initialize();
}

Scanner::Scanner(long fsz) {
  sourceBuf = new SourceBuffer(fsz);
  initialize();
}

Scanner::Scanner(FILE* source_file) {
  sourceBuf = new SourceBuffer(source_file);
  initialize();
}

InteractiveScanner::InteractiveScanner() : Scanner(ScannerBufferSize) {}

fint InteractiveScanner::read_next_char() {
  char c;
  while (true) {
    if (fread(&c, sizeof(char), 1, stdin)) return c;
    if (feof(stdin)) return EOF;
  }
}

void InteractiveScanner::discardInput() {
  fint c;
  do {
    c = read_next_char();
  } while (c != EOF  &&  c != '\n');
}

FILE* FileScanner::openFileAndReturnFile(const char* fn) {
  _fullName = NULL;
  file = Files->openSelfFile(fn, &_fullName);
  fileError= file ? 0 : errno;
  if (file == NULL) {
    if (fileError == 0) // yes, Virginia, some unix ops can fail to set errno
      fileError= ENOENT;  // such as fopen("", "r")
    return 0;
  }
  _fileName = copy_string(fn);
  return file;
}

FileScanner::FileScanner(const char* fn) : Scanner(openFileAndReturnFile(fn)) {}

StringScanner::StringScanner(const char* s, fint len, const char* fn, fint l, fint c) {
  sourceBuf= new SourceBuffer(s, len);
  _fileName = fn;
  line = l;
  column = c;
}

void InteractiveScanner::start_line(const char* prompt) {
  initSourcePos();
  column += strlen(prompt);
  lprintf("%s", prompt);
}

fint Scanner::get_char() {
  fint c;
  if (chars) {
    c = chars->c;
    chars = chars->prev;
  } else {
    c = read_next_char();
    if (c == '\n' || c == '\r') {
      line ++;
      column = 1;
    } else {
      column ++;
    }
  }
  if (c != EOF) {
    is_buffer_filled() ? sourceBuf->advance() : sourceBuf->nextPut(char(c));
  }
  return c;
}

bool Scanner::is_done() {
  fint c = get_char();
  if (c == EOF) return true;
  push_char(c);
  return false;
}

void Scanner::push_char(fint c) {
  if (c != EOF) sourceBuf->pop();
  if (!is_buffer_filled())
    chars= new CharPushback(c, chars);
  else if (c != EOF) {
    if (c == '\n' || c == '\r') {
      line--;
    } else {
      column--;
    }
    assert(char(c) == sourceBuf->current_char(), "wierd pushback");
  }
}

void Scanner::initSourcePos() {
  line = 1;
  column = 1;
  depth = 0;
  tokens = EMPTY;
  chars = EMPTY;
  if (sourceBuf) sourceBuf->reset();
}

void Scanner::resetTokenList() {
  assert(   tokens == NULL
         || tokens->prev == NULL && tokens->token->type == Token::ACCEPT,
         "unexpected token");
  tokens= NULL;
}


// syntax errors:

void Scanner::SuppressErrors(bool b) { suppress = b; }

Token* Scanner::TokenizingError(const char* msg) {
  if (suppress) {
    return NULL;
  } else {
    return new Token(Token::ERROR_TOKEN, line, column - 1, msg);
  }
}

void Scanner::ErrorMessage(const char* msg, fint l, fint c) {
  if (suppress)
    return;
  error4("%s on line %ld, character %ld of \"%s\"", msg, l, c, fileName());
}

void InteractiveScanner::ErrorMessage(const char* msg, fint l, fint c) {
  if (suppress)
    return;
  for (fint i = 1; i < c; i ++) putchar(' ');
  lprintf("^\n");
  error3("%s on line %ld, character %ld", msg, l, c);
}

const char* SourceBuffer::lastWhiteSpaceBefore(const char* start) {
  // return last (most distant) whitespace character preceding start
  // include comments in start of source

  if ( !(first <= start && start <= last) )
    // start outside of source buffer, this happens for error tokens
    // -- dmu 8/95
    return start;

  // first find the opening paren or trailing bar
  do {
    if (--start < first) return first;
    if (*start == '"') { // "skip comments"
      do {
        if (--start < first) return first;
      } while (*start != '"');
      if (--start < first) return first;
    }
  } while (is_space(*start));
  
  return start + 1;
}
    

Token* Scanner::read_numeric_escape(fint base, fint howmany, char& ch) {
  fint value = 0;
  for (fint count = 0; count < howmany; count ++) {
    fint b = get_char();
    fint digit = asnum(b);
    if (digit >= base || digit < 0) {
      return TokenizingError("invalid digit in character escape");
    }
    value = value * base + digit;
    if (value > 255) {
      return TokenizingError("invalid character escape value (>255)");
    }
  }
  ch = char(value);
  return NULL;
}

// read next char and store in into buf; read 2 chars if first char is \'
Token* Scanner::read_char(char*& buf, bool& cannot_be_a_delimeter) {
  char c = get_char();
  Token* t = NULL;
  cannot_be_a_delimeter = false;
  
  switch (c) {
   default:  *buf = c;  return NULL;
    
    // all self code assumes annotation strings have newlines in them
   // but mac reads them as \r -- dmu 6/99
   case '\r':  *buf = '\n';  return NULL;

   case '\\':  return read_escaped_char(buf, cannot_be_a_delimeter);
  }
}
     

Token* Scanner::read_escaped_char(char*& buf, bool& cannot_be_a_delimeter) {
  fint c1 = get_char();
  char c;
  Token* t = NULL;
  switch (c1) {
   // An escaped newline or CR translates to nothing, 
   // recurse to force a read of whatever is next -- dmu 6/99
   case '\n': return read_char(buf, cannot_be_a_delimeter);
   case '\r': return read_char(buf, cannot_be_a_delimeter);

   case EOF:  c = '\\'; break;
   case 'n':  c = '\n'; break;
   case 't':  c = '\t'; break;
   case 'f':  c = '\f'; break;
   case 'r':  c = '\r'; break;
   case 'v':  c = '\v'; break;
   case 'b':  c = '\b'; break;
   case 'a':  c = '\a'; break;
   
   case '?':  c =  '?'; break;
   case '\\': c = '\\'; break;
    
   // An escaped quote means to include the quote in the string.
   // Set cannot_be_a_delimeter to prevent this quote from being taken as a delimeter.
   case '\'':   c = '\'';  cannot_be_a_delimeter = true;  break;
   case  '"':   c =  '"';  cannot_be_a_delimeter = true;  break;
    
   case '0':  c = '\0'; break;
   
   // Set cannot_be_a_delimeter because a hex sequence that is equivalent to a quote
   // does NOT terminate the string.
   case 'x':  t = read_numeric_escape(16, 2, c); cannot_be_a_delimeter = true; break;
   case 'o':  t = read_numeric_escape( 8, 3, c); cannot_be_a_delimeter = true; break;
   case 'd':  t = read_numeric_escape(10, 3, c); cannot_be_a_delimeter = true; break;
   
   default:
    return TokenizingError("unknown escape sequence");
  }
  *buf = c;
  return t;
}


Token* Scanner::skip_comment() {
  fint l = line;
  fint col = column - 1;
  const char* ss = sourceAddr() - 1;

  int len = 0;

  fint c;
  bool isEscaped = false;
  do {
    c = get_char();
    buffer[len++] = char(c);
    if (c == '"'  &&  !isEscaped)
      break;
    isEscaped =  c == '\\'  ?  !isEscaped  : false;
  } while (c != EOF);

  if (c == EOF) return TokenizingError("missing trailing \" of comment");
  if (!commentsOK) {
    if (ReportLostComments)
      TokenizingError("this comment is not in code and will be lost");

    buffer[--len] = '\0';
    String* s = new String(copy_string(buffer));
    commentList->append( new Token(Token::COMMENT, s, l, col, ss));
  }
  return NULL;
}


Token* Scanner::read_name(fint c) {
  Token::TokenType t;
  fint l = line;
  fint col = column - 1;
  const char* ss = sourceAddr() - 1;
  fint len;
  if (c == ':') {
    t = Token::ARG;
    len = 0;
  } else {
    t = c == '_' ? Token::PRIMNAME : Token::NAME;
    len = 1;
    buffer[0] = char(c);
  }
  while (c = get_char(), is_id_char(c)) {
    buffer[len++] = char(c);
  }
  if (c == ':' && (t == Token::NAME || t == Token::PRIMNAME)) {
    buffer[len++] = char(c);
    if (is_upper((fint)*buffer)) t = Token::CAPKEYWORD;
    else
      t = c == '_' ? Token::PRIMKEYWORD : Token::KEYWORD;
  } 
  else {
    push_char(c);
  }
  buffer[len] = '\0';
  if (t == Token::ARG && len == 0) {
    t = as_TokenType(':');
  } else if (t == Token::NAME || t == Token::PRIMNAME) {
    c = get_char();
    if (c == '.') {
      c = get_char();
      push_char(c);
      if (is_id_alpha(c) || is_punct(c)) {
        t = Token::DELEGATE;
      } else {
        push_char('.');
      }
    } else {
      push_char(c);
    }
  }
  if (strcmp(buffer, "self") == 0) {
    if (t == Token::NAME) {
      t = Token::SELF_TOKEN;
    } else {
      return TokenizingError(
                             "using \"self\" as a parent name for a directed resend");
    }
  } else if (strcmp(buffer, "resend") == 0) {
    if (t == Token::DELEGATE) {
      t = Token::RESEND_TOKEN;
    } else {
      return TokenizingError("not using \"resend\" in a resend");
    }
  }
  String* s;
  if (t == Token::NAME    || t == Token::PRIMNAME    || t == Token::ARG || t == Token::DELEGATE ||
      t == Token::KEYWORD || t == Token::PRIMKEYWORD || t == Token::CAPKEYWORD) {
    s = new String(copy_string(buffer));
  } else {
    s = NULL;
  }
  return new Token(t, s, l, col, ss);
}

Token* Scanner::read_op(fint c) {
  fint l = line;
  fint col = column - 1;
  const char* ss = sourceAddr() - 1;
  buffer[0] = char(c);
  fint len = 1;
  while (is_punct(c = get_char())) buffer[len++] = char(c);
  push_char(c);
  buffer[len] = '\0';
  Token::TokenType t;
  String* s = NULL;
  if (strcmp(buffer, "<-") == 0) t = Token::ARROW;
  else if (strcmp(buffer, "=") == 0) t = as_TokenType('=');
  else if (strcmp(buffer, "|") == 0) t = as_TokenType('|');
  else if (strcmp(buffer, "^") == 0) t = as_TokenType('^');
  else if (strcmp(buffer, "\\") == 0 && (c == '\n' || c == '\r')) {
    get_char();
    return get_token();
  } else {
    t = Token::OPERATOR;
    s = new String(copy_string(buffer));
  }
  return new Token(t, s, l, col, ss);
}

Token* Scanner::read_number(fint c) {
  
  const int MAXSELFINT = smiOop_max->value() + 1; // maximum Self integer + 1
  fint l = line;
  fint col = column - 1;
  const char* ss = sourceAddr() - 1;
  bool neg = false;
  Token::TokenType t = Token::INTEGER;
  if (c == '-') {
    neg = true;
    c = get_char();
    if (!is_digit(c)) {
      push_char(c);
      return read_op('-');
    }
  }
  int32 i = asnum(c);
  fint base;
  double f = 0;
  
  if (c == '0') {
    if (c = get_char(), c == 'x' || c == 'X') {
      return TokenizingError("invalid numeric constant (use 16r...)");
    } else if (is_digit(c)) {
      return TokenizingError("C-style octals are not supported (use 8r...)");
    } else {
      push_char(c);
    }
  } 
  
  while (is_digit(c = get_char())) {            // read decimal number
    /* The following test is necessary; else i*10 may overflow. */
    if (i > MAXSELFINT / 10)
      return TokenizingError("numeric constant too large");
    i *= 10;
    i += asnum(c);
    if (i > MAXSELFINT || (i == MAXSELFINT && !neg)) {
      return TokenizingError("numeric constant too large");
    }
  }
  
  if (c == 'r' || c == 'R') {                   // base specification ?
    c = get_char();
    if (i < 2 || i > 36) {
      return TokenizingError("illegal base for numeric literal");
    }
    base = i;
    i = 0;
    if (is_alphadigit(c)) {
      do {
        fint v = asnum(c);
        if (v >= base) {
          if (is_digit(c)) {
            return TokenizingError("digit too large for given base");
          } else {
            return TokenizingError("need spaces between numeric literals and selectors\n\t(letter too large for given base)");
          }
        }
        int32 newi = i * base + v;
        int32 maxi = MAXSELFINT / base;
        if ((i > maxi || (i == maxi && !neg)) ||
            (newi > MAXSELFINT || (newi == MAXSELFINT && !neg))) {
          return TokenizingError("numeric constant too large");
        }
        i = newi;
        c = get_char();
      } while (is_digit(c) || (base > 10 && is_alphadigit(c)));
    } else {
      return TokenizingError("expecting a number after the base specifier");
    }
  } else {
    if (is_alpha(c) && c != 'e' && c != 'E') {
      return TokenizingError("need spaces between numeric literals and selectors");
    }
    if (c == '.') {                     // read fraction part
      c = get_char();  
      if (is_digit(c)) {
        t = Token::FLOAT;      
        double place = 1.0;
        f = (double) i;
        do {
          fint v = asnum(c);
          f += v * (place /= 10.0);
        } while (c = get_char(), is_digit(c));
      } else {
        push_char(c);
        c = '.';
      }
    }
    if (c == 'e' || c == 'E') {         // read exponent
      if (t == Token::INTEGER) {
        t = Token::FLOAT;
        f = (double) i;
      }
      bool sign = false;
      c = get_char();
      if (c == '+') {
        c = get_char();
      } else if (c == '-') {
        c = get_char();
        sign = true;
      }
      fint exp = asnum(c);
      if (! is_digit(c)) {
        return TokenizingError("illegal exponent");
      }
      while (is_alphadigit(c = get_char())) {
        if (! is_digit(c)) {
          return TokenizingError("illegal exponent");
        }
        exp *= 10;
        exp += asnum(c);
      }
      if (sign) {
        while (exp --) f /= 10.0;
      } else {
        while (exp --) f *= 10.0;
      }
    }
  }
  push_char(c);
  
  if (neg) {
    if (t == Token::INTEGER) i = - i; else f = - f;
  }
  if (t == Token::INTEGER) {
    return new Token(t, ss, i, l, col);
  } else {
    assert(t == Token::FLOAT, "unexpected token type");
    return new Token(t, f, l, col, ss);
  } 
}

Token* Scanner::read_string() {
  return read_general_string('\'', Token::STRING);
}


Token* Scanner::read_general_string(char delimiter, Token::TokenType tokenType) {
  fint l = line;
  fint col = column - 1;
  const char* ss = sourceAddr() - 1;
  char* b = buffer;
  fint c;
  bool cannot_be_a_delimeter;
  do {
    Token* t = read_char(b, cannot_be_a_delimeter);
    if (t) return t;     // Error return.
    c = *b++;
    if (b >= &buffer[ScannerBufferSize]) {
      return TokenizingError("string literal or comment too long");
    }
  } while (cannot_be_a_delimeter  ||  (c != delimiter && c != EOF));
  if (c == EOF) {
    return TokenizingError("missing trailing ' of string literal or comment");
  }
  b[-1] = '\0';
  return new Token(tokenType, 
                   new String(copy_string(buffer, b-buffer), b-buffer-1), 
                   l, col, ss);
}


Token* Scanner::read_dot() {
  fint l = line;
  fint col = column - 1;
  const char* ss = sourceAddr() - 1;
  return new Token(as_TokenType('.'), l, col, ss);
}

Token* Scanner::get_token() {
  Token* t;
  if (tokens) {
    t = tokens->token;
    tokens = tokens->prev;
  } else {
    t = NULL;
    while (t == NULL) {
      fint c = get_char();
      switch (c) {
       case EOF:
        depth = 0;
        t = new Token(Token::ACCEPT, line, column, sourceAddr());
        break;
       case '\n':
       case '\r':
        if (depth <= 0 && !is_string_scanner()) {
          t = new Token(Token::ACCEPT, line, column - 1, sourceAddr() - 1);
          depth = 0;
        }
        break;
       case ' ':
       case '\t':
       case '\v':
       case '\b':
       case '\f':
        break;
       case '"':
        t = skip_comment();
        break;
       case '(':
        depth ++;
        t = new Token(as_TokenType('('), line, column - 1, sourceAddr() - 1);
        break;
       case ')':
        depth --;
        t = new Token(as_TokenType(')'), line, column - 1, sourceAddr() - 1);
        break;
       case '[':
        depth ++;
        t = new Token(as_TokenType('['), line, column - 1, sourceAddr() - 1);
        break;
       case ']':
        depth --;
        t = new Token(as_TokenType(']'), line, column - 1, sourceAddr() - 1);
        break;
       case '.':
        t = read_dot();
        break;
       case '\'':
        t = read_string();
        break;
       case '\\':
        c = get_char();
        if (c == '\n' || c == '\r') {
          // an escaped newline; ignore
        } else {
          push_char(c);
          c = '\\';
          t = read_op(c);
        }
        break;
       case '{':
        t = new Token(Token::ANNOTATION_START, line, column - 1, sourceAddr() - 1);
        break;
       case '}':
        t = new Token(Token::ANNOTATION_END,   line, column - 1, sourceAddr() - 1);
        break;
       default:
        if (is_digit(c) || c == '-') t = read_number(c);
        else if (is_id_alpha(c) || c == ':') t = read_name(c);
        else if (is_punct(c)) t = read_op(c);
        else t = TokenizingError("unknown character in input");
      }
    }
  }
  if (t && PrintTokens) t->print();
  return t;
}

void Token::print() {
  switch (type) {
   case ERROR_TOKEN:
    lprintf("an lexical error token");
    break;
   case ACCEPT:
    lprintf("the end-of-expression token");
    break;
   case INTEGER:
    lprintf("an integer literal token: %ld", long(integer));
    break;
   case FLOAT:
    lprintf("a float literal token: %g", floating);
    break;
   case STRING:
    lprintf("a string literal token: '");
    string->Print();
    lprintf("'");
    break;
   case SELF_TOKEN:
    lprintf("the self token");
    break;
   case RESEND_TOKEN:
    lprintf("the resend token");
    break;
   case NAME:
    lprintf("a name token: "); 
    string->Print();
    break;
   case PRIMNAME:
    lprintf("a primitive name token: "); 
    string->Print();
    break;
   case DELEGATE:
    lprintf("a delegatee token: "); 
    string->Print();
    break;
   case OPERATOR:
    lprintf("a binary operator token: ");
    string->Print();
    break;
   case KEYWORD:
    lprintf("a keyword token: ");
    string->Print();
    break;
   case PRIMKEYWORD:
    lprintf("a primitive keyword token: ");
    string->Print();
    break;
   case CAPKEYWORD:
    lprintf("a capitalized keyword token: ");
    string->Print();
    break;
   case ARG:
    lprintf("an argument token: ");
    string->Print();
    break;
   case ARROW:
    lprintf("the <- token");
    break;
   default:
    lprintf("a '%c' token", type);
    break;
  }
  lprintf("\n");
}

