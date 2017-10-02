#pragma once
/* Sun-$Revision: 30.8 $ */

/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */
# include "config.hh"
# include "lprintf.hh"



# define error(m)                                                             \
  lprint_error(m)

# define error1(m, x1)                                                        \
   lprint_error(m, (x1))

# define error2(m, x1, x2)                                                    \
   lprint_error(m, (x1), (x2))

# define error3(m, x1, x2, x3)                                                \
   lprint_error(m, (x1), (x2), (x3))

# define error4(m, x1, x2, x3, x4)                                            \
   lprint_error(m, (x1), (x2), (x3), (x4))

# define error5(m, x1, x2, x3, x4, x5)                                        \
   lprint_error(m, (x1), (x2), (x3), (x4), (x5))

# define error6(m, x1, x2, x3, x4, x5, x6)                                    \
   lprint_error(m, (x1), (x2), (x3), (x4), (x5), (x6))

# define error7(m, x1, x2, x3, x4, x5, x6, x7)                                \
   lprint_error(m, (x1), (x2), (x3), (x4), (x5), (x6), (x7))

# define error8(m, x1, x2, x3, x4, x5, x6, x7, x8)                            \
   lprint_error(m, (x1), (x2), (x3), (x4), (x5), (x6), (x7), (x8))

# define error9(m, x1, x2, x3, x4, x5, x6, x7, x8, x9)                        \
   lprint_error(m, (x1), (x2), (x3), (x4), (x5), (x6), (x7), (x8), (x9))

# define warning(m)                                                           \
  lprint_warning(m)

# define warning1(m, x1)                                                      \
   lprint_warning(m, (x1))

# define warning2(m, x1, x2)                                                  \
   lprint_warning(m, (x1), (x2))

# define warning3(m, x1, x2, x3)                                              \
   lprint_warning(m, (x1), (x2), (x3))

# define warning4(m, x1, x2, x3, x4)                                          \
   lprint_warning(m, (x1), (x2), (x3), (x4))

# define warning5(m, x1, x2, x3, x4, x5)                                      \
   lprint_warning(m, (x1), (x2), (x3), (x4), (x5))

# define warning6(m, x1, x2, x3, x4, x5, x6)                                  \
   lprint_warning(m, (x1), (x2), (x3), (x4), (x5), (x6))

# define warning7(m, x1, x2, x3, x4, x5, x6, x7)                              \
   lprint_warning(m, (x1), (x2), (x3), (x4), (x5), (x6), (x7))

# define warning8(m, x1, x2, x3, x4, x5, x6, x7, x8)                          \
   lprint_warning(m, (x1), (x2), (x3), (x4), (x5), (x6), (x7), (x8))

# define warning9(m, x1, x2, x3, x4, x5, x6, x7, x8, x9)                      \
   lprint_warning(m, (x1), (x2), (x3), (x4), (x5), (x6), (x7), (x8), (x9))

# define fatal(m)                                                             \
    lprint_fatal(__FILE__, __LINE__, m)
# define fatal1(m, x1)                                                        \
    lprint_fatal(__FILE__, __LINE__, m, (x1))

# define fatal2(m, x1, x2)                                                    \
    lprint_fatal(__FILE__, __LINE__, m, (x1), (x2))

# define fatal3(m, x1, x2, x3)                                                \
    lprint_fatal(__FILE__, __LINE__, m, (x1), (x2), (x3))

# define fatal4(m, x1, x2, x3, x4)                                            \
    lprint_fatal(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4))

# define fatal5(m, x1, x2, x3, x4, x5)                                        \
    lprint_fatal(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5))

# define fatal6(m, x1, x2, x3, x4, x5, x6)                                    \
    lprint_fatal(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5), (x6))

# define fatal7(m, x1, x2, x3, x4, x5, x6, x7)                                \
    lprint_fatal(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5), (x6),\
                                        (x7))

# define fatal8(m, x1, x2, x3, x4, x5, x6, x7, x8)                            \
    lprint_fatal(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5), (x6),\
                                        (x7), (x8))

# define fatal9(m, x1, x2, x3, x4, x5, x6, x7, x8, x9)                        \
    lprint_fatal(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5), (x6),\
                                        (x7), (x8), (x9))

# define fatalNoMenu(m)                                                       \
    lprint_fatalNoMenu(__FILE__, __LINE__, m)
# define fatalNoMenu1(m, x1)                                                  \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1))

# define fatalNoMenu2(m, x1, x2)                                              \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1), (x2))

# define fatalNoMenu3(m, x1, x2, x3)                                          \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1), (x2), (x3))

# define fatalNoMenu4(m, x1, x2, x3, x4)                                      \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4))

# define fatalNoMenu5(m, x1, x2, x3, x4, x5)                                  \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5))

# define fatalNoMenu6(m, x1, x2, x3, x4, x5, x6)                              \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5),\
                                              (x6))

# define fatalNoMenu7(m, x1, x2, x3, x4, x5, x6, x7)                          \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5),\
                                              (x6), (x7))

# define fatalNoMenu8(m, x1, x2, x3, x4, x5, x6, x7, x8)                      \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5),\
                                              (x6), (x7), (x8))

# define fatalNoMenu9(m, x1, x2, x3, x4, x5, x6, x7, x8, x9)                  \
    lprint_fatalNoMenu(__FILE__, __LINE__, m, (x1), (x2), (x3), (x4), (x5),\
                                              (x6), (x7), (x8), (x9))

extern "C" {
  void breakpoint();
  void error_breakpoint();
}
