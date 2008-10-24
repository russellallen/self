/* Sun-$Revision: 30.6 $ */

/* Copyright 1992-2006 Sun Microsystems, Inc. and Stanford University.
   See the LICENSE file for license information. */
# if defined(MACTOOLBOX_LIB) || __MWERKS__
#  ifdef IN_PRIM_TABLE

    macToolbox1_entries
    macToolbox2_entries
    macToolbox3_entries
    macToolbox4_entries
    macToolbox5_entries
    macToolbox6_entries
{
      "TestWindow", 
      fntype(&MacToolboxWindow::test_window_prim),
      ExternalPrimitive, ReceiverPrimType,
      SIDEEFFECTS,
      "Used to put a Mac Window on the screen to test events."
},
#   endif
# endif
