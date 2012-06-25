/*
    SelfConsoleView.h
    Self
 */
/*  Copyright 1992-2012 AUTHORS.
    See the LICENSE file for license information. */

#undef ASSEMBLER
#import <AppKit/AppKit.h>
#import "Pty.h"


@interface SelfConsoleView : NSTextView
{  
  Pty*        pty;
}

@property (nonatomic, retain) Pty*  pty;

- (void) initPty: (Pty*) aPseudoTTY;

@end

