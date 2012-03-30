//
//  SelfAppDelegate.m
//  Self
//
//  Created by Russell Allen on 7/01/12.
//  Copyright 2012 AUTHORS. All rights reserved.
//

#import "SelfAppDelegate.h"
#import "RunningSelfVMManagerModel.h"
#import "SelfWorld.h"

#include <Security/Authorization.h>
#include <Security/AuthorizationTags.h>


@implementation SelfAppDelegate

@synthesize window;

//- (id)init
//{
//    self = [super init];
//    if (self) {
//        // Initialization code here.
//        // Initialise model to keep track of running VMs
//        vmManagerModel = [[RunningSelfVMManagerModel alloc] init];
//    }
//    return self;
//}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
}

// INSTALLING VM

-(int)installVM
{
    // Create shell script
    
    NSBundle* myBundle = [NSBundle mainBundle];
    NSString* myVM = [myBundle pathForResource:@"Self"ofType:@"app"];
    myVM = [myVM stringByAppendingString:@"/Contents/MacOS/Self"];

    NSString* str = @"#!/bin/sh\n";
    str = [str stringByAppendingString:myVM];
    str = [str stringByAppendingString:@" $@"];
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init]; 
    [attributes setObject:[NSNumber numberWithInt:493] forKey:NSFilePosixPermissions]; 
            /*493 is Decimal for the 755 octal*/ 
    
    NSData* data  = [str dataUsingEncoding:NSUTF8StringEncoding];    
    [[NSFileManager defaultManager] createFileAtPath: @"/tmp/Self"
                           contents: data
                         attributes: attributes];
    
    // Create installation script

    str = @"#!/bin/sh\ncp /tmp/Self /usr/bin/Self\nchmod 755 /usr/bin/Self";
    attributes = [[NSMutableDictionary alloc] init]; 
    [attributes setObject:[NSNumber numberWithInt:493] forKey:NSFilePosixPermissions]; 
    /*493 is Decimal for the 755 octal*/ 
    
    data  = [str dataUsingEncoding:NSUTF8StringEncoding];    
    [[NSFileManager defaultManager] createFileAtPath: @"/tmp/Self-install"
                                            contents: data
                                          attributes: attributes];
    
    
    // Run installation script with authorisation privileges
    
    OSStatus myStatus;
    AuthorizationFlags myFlags = kAuthorizationFlagDefaults;              // 1
    AuthorizationRef myAuthorizationRef;                                  // 2
    
    myStatus = AuthorizationCreate(NULL, kAuthorizationEmptyEnvironment,  // 3
                                   myFlags, &myAuthorizationRef);
    
    if (myStatus != errAuthorizationSuccess)
        return myStatus;
    
    {
        AuthorizationItem myItems = {kAuthorizationRightExecute, 0,    // 4
            NULL, 0};
        
        AuthorizationRights myRights = {1, &myItems};                  // 5
        
        myFlags = kAuthorizationFlagDefaults |                         // 6
        kAuthorizationFlagInteractionAllowed |
        kAuthorizationFlagPreAuthorize |
        kAuthorizationFlagExtendRights;
        
        myStatus = AuthorizationCopyRights (myAuthorizationRef,        // 7
                                            &myRights, NULL, myFlags, NULL );
    }
    
    if (myStatus != errAuthorizationSuccess) goto DoneWorking;
    
    {
        char myToolPath[] = "/tmp/Self-install";
        char *myArguments[] = { NULL };
        FILE *myCommunicationsPipe = NULL;
        char myReadBuffer[128];
        
        myFlags = kAuthorizationFlagDefaults;                          // 8
        myStatus = AuthorizationExecuteWithPrivileges                  // 9
        (myAuthorizationRef, myToolPath, myFlags, myArguments,
         &myCommunicationsPipe);
        
        if (myStatus == errAuthorizationSuccess)
            for(;;)
            {
                int bytesRead = read (fileno (myCommunicationsPipe),
                                      myReadBuffer, sizeof (myReadBuffer));
                
                if (bytesRead < 1) goto DoneWorking;
                write (fileno (stdout), myReadBuffer, bytesRead);
            }
    }
    
    DoneWorking:
    
    AuthorizationFree (myAuthorizationRef, kAuthorizationFlagDefaults); // 10
    
    if (myStatus) printf("Status: %d\n", myStatus);
    
    return myStatus;
    
}
// SETUP

-(void)setModel:(RunningSelfVMManagerModel *)model
{
    vmManagerModel = model;
}

// QUITTING

- (void)quitDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
    if (returnCode == NSAlertFirstButtonReturn) {
        [vmManagerModel killAll];
        [NSApp replyToApplicationShouldTerminate: YES];
    } else {
        [NSApp replyToApplicationShouldTerminate: NO];
    }
}

- (NSApplicationTerminateReply) applicationShouldTerminate: (NSApplication*) sender 
{
    if (![vmManagerModel warnBeforeClose]) {
        // We can quit straight away because there are no Self VMs running
        return NSTerminateNow;
    }
    NSAlert *alert = [[[NSAlert alloc] init] autorelease];
    [alert addButtonWithTitle:@"Quit"];
    [alert addButtonWithTitle:@"Cancel"];
    [alert setMessageText:@"Quit Self?"];
    [alert setInformativeText:@"Quitting Self will terminate all running Self instances without snapshotting."];
    [alert setAlertStyle:NSWarningAlertStyle];
    [alert beginSheetModalForWindow:window 
                      modalDelegate:self 
                     didEndSelector:@selector(quitDidEnd:returnCode:contextInfo:) 
                        contextInfo:nil];
    return NSTerminateLater; 
} 

- (void)quit:(NSNotification *)aNotification
{
    [NSApp terminate:self];
}

// END QUITTING

// EMPTY VM

- (void)emptyVM:(NSNotification *)aNotification
{
    [self showIntroAlert];
}

-(void)showIntroAlert
{
    NSAlert *alert = [[[NSAlert alloc] init] autorelease];
    [alert addButtonWithTitle:@"Continue..."];
    [alert setMessageText:@"Choose a CWD"];
    [alert setInformativeText:@"You will need to choose a current working directory to start the VM from."];
    [alert setAlertStyle:NSInformationalAlertStyle];
    [alert beginSheetModalForWindow:window modalDelegate:self didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

- (void)alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode
        contextInfo:(void *)contextInfo;
{
    // No idea why this works, but without it we get very strange window stuff.
    [NSTimer scheduledTimerWithTimeInterval:0.0
                                     target:self
                                   selector:@selector(cwdDialog)
                                   userInfo:nil
                                    repeats:NO];
}

- (void)cwdDialog
{
    NSOpenPanel* panel = [[NSOpenPanel openPanel] retain];
    [panel setCanChooseFiles:NO];
    [panel setCanChooseDirectories:YES];
    [panel setAllowsMultipleSelection:NO];
    [panel beginSheetModalForWindow:window completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {            
            for (NSURL *fileURL in [panel URLs]) {
                [self openEmptyVM:fileURL];
            }
        }        
        [panel release];
    }];
    
}

- (void)openEmptyVM:(NSURL*)aUrl
{
    SelfWorld *w = [[SelfWorld alloc] init];
    [w runEmptyOn:aUrl];
    [vmManagerModel registerRunningVM: w];
}


// END EMPTY VM

// OPENING

- (void)openSnapshot:(NSURL*)aUrl
{
    SelfWorld *w = [[SelfWorld alloc] init];
    [w runSnapshot: aUrl];
    [vmManagerModel registerRunningVM: w];
}

- (void)fileDialog
{
    NSOpenPanel* panel = [[NSOpenPanel openPanel] retain];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:YES];
    [panel setAllowedFileTypes:[NSArray arrayWithObject:@"snap"]];
    
    [panel beginSheetModalForWindow:window completionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {            
            for (NSURL *fileURL in [panel URLs]) {
                [self openSnapshot:fileURL];
            }
        }        
        [panel release];
    }];
    
}

- (void)chooseSnapshot:(NSNotification *)aNotification
{
    [self fileDialog];
}

- (void)openDocument:(id)sender
{
    [self fileDialog]; 
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
{
    [self openSnapshot:[NSURL URLWithString:filename]];
    return TRUE;
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
    return NO;
}

// END OPENING

@end
