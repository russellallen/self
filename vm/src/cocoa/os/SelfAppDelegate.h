/*
    SelfAppDelegate.h
    Self
 */
/*  Copyright 1992-2012 AUTHORS.
    See the LICENSE file for license information. */


#import <Cocoa/Cocoa.h>
#import "SelfConsoleView.h"
#import "Pty.h"

# if defined(__clang__)
  # define BEGIN_AUTORELEASE_POOL @autoreleasepool {
  # define END_AUTORELEASE_POOL }
# else
  # define BEGIN_AUTORELEASE_POOL \
    NSAutoreleasePool *localPool; \
    localPool = [[NSAutoreleasePool alloc] init];
  # define END_AUTORELEASE_POOL \
    [localPool release];
# endif

#pragma mark Arguments Container

@interface MainArgs : NSObject 
{
@public
  int    argc;
  char **argv;
}
- (MainArgs*) initWithArgc: (int)argc argv: (char**)argv;
- (BOOL) snapshotIndicated;
- (BOOL) scriptIndicated;
@end

#pragma mark VM Starting Helper


@interface SelfVMStarter : NSObject {
}
- (void) startSelfVM: (MainArgs*)args;
@end


#pragma mark Application Delegate

@interface SelfAppDelegate : NSObject <NSApplicationDelegate>
{
  NSWindow*        console;
  NSMenuItem*      consoleMenuItem;
  SelfConsoleView* consoleView;
  Pty*             pty;
  BOOL             vmIsRunning;
}

@property (assign) IBOutlet NSWindow*        console;
@property (assign) IBOutlet NSMenuItem*      consoleMenuItem;
@property (assign) IBOutlet SelfConsoleView* consoleView;
@property (retain)          Pty*             pty;
@property (assign)          BOOL             vmIsRunning;

- (IBAction) toggleConsole: (id) sender;
- (IBAction) openSnapshotDialog: (id) sender;
- (IBAction) startVMAsIs: (id) sender;

@end
