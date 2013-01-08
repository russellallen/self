/*
    SelfAppDelegate.m
    Self
 */
/*  Copyright 1992-2012 AUTHORS.
    See the LICENSE file for license information. */


#import "SelfAppDelegate.h"

#pragma mark Arguments Container

extern MainArgs* args;

@implementation MainArgs
- (MainArgs*) initWithArgc: (int)argc2 argv: (char**)argv2 {
  argc = argc2;
  argv = argv2;
  return self;
}

- (BOOL) hasArgument: (const char*) arg withParameter: (BOOL) parameter
{
  BOOL indicated = NO;
  size_t argLen = strlen(arg);
  int i;
  for (i=0; i < argc; ++i) {
    if (strncmp(args->argv[i], arg, MIN(strlen(args->argv[i]), argLen)) == 0) {
      if (!parameter || argc > i) {
        indicated = YES;
        break;
      }
    }
  }
  return indicated;
}

- (BOOL) snapshotIndicated
{
  return [self hasArgument: "-s" withParameter: YES];
}

- (BOOL) scriptIndicated
{
  return [self hasArgument: "-f" withParameter: YES];
}

@end

#pragma mark Private App Delegate Interface: Starting
@interface SelfAppDelegate (Starting)

- (void) warnNoSnapshotMaybeScript: (BOOL) scriptInidicated;
- (void) setupConsole;
- (void) startVMWithArgs: (MainArgs*) args;
- (void) checkForSnapshotAndStart;
- (void) startVMWithFile: (NSURL*) url;

@end

@interface SelfAppDelegate (NSAlertFinishingDelegate)

- (void) alertDidEnd:(NSAlert *)alert 
          returnCode:(NSInteger)returnCode 
         contextInfo:(void *)contextInfo;

@end

#pragma mark The App Delegate

@implementation SelfAppDelegate

@synthesize console;
@synthesize consoleMenuItem;
@synthesize consoleView;
@synthesize pty;
@synthesize vmIsRunning;


#pragma mark Starting the VM

- (void) startVMWithArgs: (MainArgs*) args
{
  BEGIN_AUTORELEASE_POOL
    if (!self.vmIsRunning) {
      SelfVMStarter* vmStarter = [[SelfVMStarter alloc] init];
      [NSThread detachNewThreadSelector: @selector(startSelfVM:) 
                               toTarget: vmStarter 
                             withObject: (id)args];
      self.vmIsRunning = YES;
    }
  END_AUTORELEASE_POOL
}

- (void) startVMWithFile: (NSURL*) url
{
  [[NSDocumentController sharedDocumentController] 
    noteNewRecentDocumentURL: url];

  /* fiddle in the snapshot. do so at the beginning of the args */
  char** newArgv = malloc(sizeof(char*) * (args->argc+2));
  
  /* zeroth arg == program remains same. */
  newArgv[0] = args->argv[0];  
  /* the new arg: snapshot or script */
  newArgv[1] = [[url path] hasSuffix: @"snap"] ?  "-s" : "-f";  
  newArgv[2] = strdup([[url path] UTF8String]);
  /* the 1st to last arg are mapped to 3rd to (old-last)+2 */
  int i;
  for (i = 3; i < (args->argc + 2); i++) {
    newArgv[i] = args->argv[i - 3];
  }
  args->argv = newArgv;
  args->argc += 2;
   
  /* start the vm */
  [self startVMWithArgs: args];
}

- (void) setupConsole
{
  pty = [[Pty alloc] init];
  int dupfd;
  
  /*
   *  We duplicate stdin and stdout to our console.
   */
  dupfd = dup2([[pty slave] fileDescriptor], 
               [[NSFileHandle fileHandleWithStandardInput] fileDescriptor]);
  if (dupfd == -1) {
    [NSException raise: @"CannotAssignStdinErrorException" 
                format: @"%s", strerror(errno)];    
  }
  
  fflush(stdout);
  dupfd = dup2([[pty slave] fileDescriptor], 
               [[NSFileHandle fileHandleWithStandardOutput] fileDescriptor]);
  if (dupfd == -1) {
    [NSException raise: @"CannotAssignStdoutErrorException" 
                format: @"%s", strerror(errno)];    
  }

  if (YES) {
    dupfd = dup2([[pty slave] fileDescriptor], 
                 [[NSFileHandle fileHandleWithStandardError] fileDescriptor]);
    if (dupfd == -1) {
      [NSException raise: @"CannotAssignStderrErrorException" 
                  format: @"%s", strerror(errno)];    
    }

  }
  
  [consoleView initPty: pty];
}

- (void) warnNoSnapshotMaybeScript: (BOOL) scriptIndicated
{
  NSAlert* alert = [[[NSAlert alloc] init] autorelease];
  [alert addButtonWithTitle: @"Choose…"];
  if (scriptIndicated) {
    [alert addButtonWithTitle: @"Continue"];
    [alert setMessageText: @"No snapshot selected"];
    [alert setInformativeText: 
       @"You want to start Self with a script but have no snapshot. "
       "Please choose a snapshot or decide to continue without it."];
    [alert setAlertStyle: NSInformationalAlertStyle];
  } else {
    [alert addButtonWithTitle: @"Run without"];
    [alert addButtonWithTitle: @"Cancel"];
    [alert setMessageText: @"No snapshot or script selected"];
    [alert setInformativeText: 
       @"You want to start Self without a snapshot or startup script. "
       "Please choose a snapshot or script, or decide to run without either."];
    [alert setAlertStyle: NSWarningAlertStyle];
  }

  [alert beginSheetModalForWindow: [NSApp keyWindow] 
                    modalDelegate: self 
                   didEndSelector: @selector(alertDidEnd:returnCode:contextInfo:)
                      contextInfo: nil];
}

- (void) alertDidEnd:(NSAlert *)alert 
          returnCode:(NSInteger)returnCode 
         contextInfo:(void *)contextInfo
{
  if (returnCode == NSAlertFirstButtonReturn) {
    [self openSnapshotDialog: self];
  } else if (returnCode == NSAlertSecondButtonReturn) {
    [self startVMAsIs: self];
  } 
  // rest is irrelevant.
}

- (void) checkForSnapshotAndStart
{
  if (![args snapshotIndicated]) {
    [self warnNoSnapshotMaybeScript: [args scriptIndicated]];
  } else {
    [self startVMAsIs: self];
  }
}

#pragma mark App Delegate messages

- (id) init
{
  if (self = [super init]) {
    self.vmIsRunning = NO;
  }
  return self;
}

- (void) applicationDidFinishLaunching: (NSNotification *)aNotification
{
  if (!self.vmIsRunning) {
    [self checkForSnapshotAndStart];
  }
}

- (void) dealloc 
{
  if (pty) [pty release];
  [super dealloc];
}

- (BOOL) application: (NSApplication*) sender openFile: (NSString*) filename
{
  if ([filename hasSuffix: @".snap"] && [args snapshotIndicated]) {
    // there is already a snapshot.
    return NO;
  }
  [self startVMWithFile: [NSURL URLWithString: filename]];
  return YES;
}

#pragma mark Actions

- (IBAction) showConsole: (id) sender
{
  static BOOL isSetUp = NO;
  [console makeKeyAndOrderFront: sender];
  if (!isSetUp) {
    [self setupConsole];
    isSetUp = YES;
  }
  [consoleMenuItem setState: NSOnState];
}

- (IBAction) hideConsole: (id) sender
{
  [console orderOut: sender];
  [consoleMenuItem setState: NSOffState];
}

- (IBAction) toggleConsole: (id) sender
{
  if ([console isVisible]) {
    [self hideConsole: sender];
  } else {
    [self showConsole: sender];
  }
}

- (IBAction) openSnapshotDialog: (id) sender
{
  NSOpenPanel* panel = [[NSOpenPanel openPanel] retain];
  [panel setCanChooseFiles: YES];
  [panel setCanChooseDirectories: NO];
  [panel setAllowsMultipleSelection: NO];
  [panel setAllowsOtherFileTypes: YES];
  [panel setAllowedFileTypes: [NSArray arrayWithObjects: @"snap", @"self", nil]];
  
  [panel beginWithCompletionHandler:
   ^(NSInteger result){
    if (result == NSFileHandlingPanelOKButton) {            
      for (NSURL *fileURL in [panel URLs]) {
        [self startVMWithFile: fileURL];
      }
    }        
    [panel release];
  }];

}

- (IBAction) startVMAsIs: (id) sender
{
  /* start the vm. we just presume no args. */
  [self startVMWithArgs: args];
}

@end
