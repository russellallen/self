//
//  SelfWorld.m
//  Self
//
//  Created by Russell Allen on 22/02/12.
//  Copyright (c) 2012 AUTHORS. All rights reserved.
//

#import "SelfWorld.h"
#import "RunningSelfVMManagerModel.h"

#include <unistd.h>
#include <signal.h>

@implementation SelfWorld

-(void)dealloc {
    [name release];
    [task release];
    [super dealloc];
}

-(SelfWorld *)runWithCwd:(NSString*)cwd Snapshot:(NSString*)snap
{
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
    NSBundle* myBundle = [NSBundle mainBundle];
    NSString* myVM = [myBundle pathForResource:@"Self"ofType:@"app"];
    myVM = [myVM stringByAppendingString:@"/Contents/MacOS/Self"];
    
    NSString* command = @"#!/bin/sh\ncd \"";
    command = [command stringByAppendingString:cwd];
    command = [command stringByAppendingString:@"\"\n\""];    
    command = [command stringByAppendingString:myVM];
    command = [command stringByAppendingString:@"\" "];
    
    // If we are loading a snapshot
    NSLog(@"%@", snap);    
    if(![snap isEqualToString:@""])
    {
    command = [command stringByAppendingString:@" -s \""];
    command = [command stringByAppendingString:snap];
    command = [command stringByAppendingString:@"\""];
    }
    
    NSLog(@"%@", command);
    
    // Create temporary filename
    
    NSString *tempFileTemplate = [NSTemporaryDirectory() stringByAppendingPathComponent:@"selfsnapshot.XXXXXX"];
    const char *tempFileTemplateCString = [tempFileTemplate fileSystemRepresentation];
    char *tempFileNameCString = (char *)malloc(strlen(tempFileTemplateCString) + 1);
    strcpy(tempFileNameCString, tempFileTemplateCString);
    int fileDescriptor = mkstemp(tempFileNameCString);
    
    if (fileDescriptor == -1)
    {
        // handle file creation failure
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:@"Couldn't allocate tempfile."];
        [alert setInformativeText:@"Cannot run the snapshot because could not allocate a tempfile."];
        [alert addButtonWithTitle:@"Ok"];
        [alert runModal];
        return self;
    }
    
    // This is the file name
    NSString *tmp = [[NSFileManager defaultManager] stringWithFileSystemRepresentation:tempFileNameCString length:strlen(tempFileNameCString)];
    free(tempFileNameCString);
    NSLog(@"%@", tmp);
    
    [command writeToFile: tmp atomically: YES encoding:NSASCIIStringEncoding error:NULL];
    
    NSDictionary *defaultEnvironment = [[NSProcessInfo processInfo] environment];
    NSMutableDictionary *environment = [[NSMutableDictionary alloc] initWithDictionary:defaultEnvironment];
    [environment setObject:@"YES" forKey:@"NSUnbufferedIO"];
    
    outputPipe = [NSPipe pipe];
    taskOutput = [outputPipe fileHandleForReading];
    
    inputPipe = [NSPipe pipe];
    taskInput = [inputPipe fileHandleForWriting];
    
    task = [[[NSTask alloc]init]retain];
    //[task setLaunchPath:@"/bin/sh"];
    [task setLaunchPath:@"/usr/bin/screen"];
    [task setArguments: [NSArray arrayWithObjects: @"-S", [self getNameForScreen], @"-D", @"-m", @"sh", tmp, nil]];
    [task setEnvironment:environment];
    [task setStandardInput:inputPipe];
    [task setStandardOutput:outputPipe];
    [task setStandardError:outputPipe];
    
    [defaultCenter addObserver:self selector:@selector(taskCompleted:) name:NSTaskDidTerminateNotification object:task];
    [defaultCenter addObserver:self selector:@selector(taskDataAvailable:) name:NSFileHandleReadCompletionNotification object:taskOutput];
    
    [task launch];
    [taskOutput readInBackgroundAndNotify];
        
    return self;
}

-(SelfWorld *)runEmptyOn:(NSURL *)aUrl
{
    name = [[aUrl path]copy];
    [self runWithCwd:name Snapshot:@""];
    return self;
}

-(SelfWorld *)runSnapshot:(NSURL *)aUrl
{
    NSString* cwd = [[aUrl path] substringToIndex: ([[aUrl path] length] - [[aUrl lastPathComponent] length])];
    [self runWithCwd:cwd Snapshot:[aUrl lastPathComponent]];
    name = [[aUrl path]copy];
    return self;
}

-(NSString *)getName
{
    return name;
}

-(NSString *)getDisplayName
{
    return [[[name lastPathComponent] stringByAppendingString: @" - "] stringByAppendingString:name];
}

-(NSString *)getNameForScreen
{
    // Lazy initialise a unique id for screen
    if (screenid == NULL){
        screenid = [@"SELF" stringByAppendingString:[[self UUIDString] stringByReplacingOccurrencesOfString: @"-" withString: @""]];
    }
    return screenid;
}

-(NSString*)UUIDString
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return [(NSString *)string autorelease];
}

-(BOOL)isRunning
{
    return [task isRunning];
}

-(void)terminate
{
    if ([task isRunning]) {kill(task.processIdentifier, SIGKILL);}
    //was {[task terminate];} but SIGKILL not SIGTERM to make sure we die
}

-(void)notifyMe:(RunningSelfVMManagerModel *)m
{
    manager = m;
    [NSThread detachNewThreadSelector: @selector(checkRunning:)
                             toTarget: self withObject: nil];
}

- (void)taskCompleted:(NSNotification *)notif
{
    int exitCode = [[notif object] terminationStatus];
    
    if (exitCode != 0)
        NSLog(@"Error: Task exited with code %d", exitCode);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    // Do whatever else you need to do when the task finished
}

- (void)taskDataAvailable:(NSNotification *)notif
{
    NSData *incomingData = [[notif userInfo] objectForKey:NSFileHandleNotificationDataItem];
    if (incomingData && [incomingData length])
    {
        NSString *incomingText = [[NSString alloc] initWithData:incomingData encoding:NSASCIIStringEncoding];
        // Do whatever with incomingText, the string that has some text in it
        NSLog(@"%@", incomingText);
        [taskOutput readInBackgroundAndNotify];
        [incomingText release];
        return;
    }
}

- (void)sendData:(NSString *)dataString
{
    [taskInput writeData:[dataString dataUsingEncoding:[NSString defaultCStringEncoding]]];
}

-(void)checkRunning:(id)v
{
    [task waitUntilExit];
    [manager notifyTaskEnded: self];
}

@end
