//
//  SelfAppDelegate.h
//  Self
//
//  Created by Russell Allen on 7/01/12.
//  Copyright 2012 AUTHORS. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class RunningSelfVMManagerModel;

@interface SelfAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    RunningSelfVMManagerModel *vmManagerModel;
}

@property (assign) IBOutlet NSWindow *window;

-(void)setModel:(RunningSelfVMManagerModel *)model;
-(int)installVM;

@end
