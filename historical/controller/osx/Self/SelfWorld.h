//
//  SelfWorld.h
//  Self
//
//  Created by Russell Allen on 7/01/12.
//  Copyright 2012 AUTHORS. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/NSAppleScript.h>

@class RunningSelfVMManagerModel;

@interface SelfWorld : NSObject {
    NSTask *task;
    NSString *name;
    NSString *screenid;
    RunningSelfVMManagerModel *manager;
    
    NSFileHandle *taskOutput;
    NSPipe *outputPipe;
    NSFileHandle *taskInput;
    NSPipe *inputPipe;
    
}

-(SelfWorld *)runSnapshot:(NSURL *)aUrl;
-(SelfWorld *)runEmptyOn:(NSURL *)aUrl;
-(NSString *)getName;
-(NSString *)getDisplayName;
-(NSString *)getNameForScreen;
-(void)terminate;
-(BOOL)isRunning;
-(void)notifyMe:(RunningSelfVMManagerModel *)m;

@end

