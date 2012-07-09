/*
    main.mm
    Self
 */
/*  Copyright 1992-2012 AUTHORS.
    See the LICENSE file for license information. */

#undef ASSEMBLER
#import <Cocoa/Cocoa.h>
#import "SelfAppDelegate.h"
#import "SelfConsoleView.h"

MainArgs* args;


extern int old_main(int argc, char *argv[]);

@implementation SelfVMStarter

- (void) startSelfVM: (MainArgs*) args {
  BEGIN_AUTORELEASE_POOL
    old_main(args->argc, args->argv);
  END_AUTORELEASE_POOL
}

@end


int main(int argc, char *argv[])
{
    args = [[MainArgs alloc] initWithArgc: argc argv: argv];
    NSApplicationMain(argc, (const char**)argv);
    return 0;
}
