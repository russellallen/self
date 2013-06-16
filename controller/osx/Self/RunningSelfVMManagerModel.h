//
//  RunningSelfVMManagerModel.h
//  Self
//
//  Created by Russell Allen on 13/01/12.
//  Copyright 2012 AUTHORS. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class SelfWorld;

@interface RunningSelfVMManagerModel : NSObject <NSTableViewDelegate, NSTableViewDataSource> {
    NSMutableArray *running;
    IBOutlet NSTableView* myTable;
    IBOutlet NSButton* openTerminalButton;
    IBOutlet NSButton* forceQuitButton;
}

-(void)registerRunningVM:(SelfWorld *)vm;
-(void)killAll;
-(NSString*)screenIDOfSelectedWorld;
-(BOOL)warnBeforeClose;
-(void)notifyTaskEnded:(SelfWorld *)vm;
-(void)forceQuit:(NSNotification *)aNotification;
-(void)openTerminal:(NSNotification *)aNotification;

@property (nonatomic, retain) IBOutlet NSTableView* myTable;
@property (nonatomic, retain) IBOutlet NSButton* openTerminalButton;
@property (nonatomic, retain) IBOutlet NSButton* forceQuitButton;

@end
