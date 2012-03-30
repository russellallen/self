//
//  RunningSelfVMManagerModel.m
//  Self
//
//  Created by Russell Allen on 13/01/12.
//  Copyright 2012 AUTHORS. All rights reserved.
//

#import "RunningSelfVMManagerModel.h"
#import "SelfAppDelegate.h"
#import "SelfWorld.h"

@implementation RunningSelfVMManagerModel

@synthesize myTable;
@synthesize openTerminalButton;
@synthesize forceQuitButton;

-(void)awakeFromNib
{
    // Register myself for use by application
    SelfAppDelegate *app = [NSApp delegate];
    [app setModel: self];
    [openTerminalButton setEnabled:NO];
    [forceQuitButton setEnabled:NO];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        running = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) dealloc 
{
    [running release]; 
    [super dealloc]; 
}

-(void)registerRunningVM:(SelfWorld *)vm
{
    [running addObject: vm];
    [vm notifyMe:self];
    [myTable reloadData];
}

-(BOOL)warnBeforeClose
{
    return [running count] > 0;
}

-(void)killAll
{
    NSTask *t;
    NSEnumerator* myIterator = [running objectEnumerator];
    
    while( t = [myIterator nextObject])
    {
        [t terminate];
    }
}

-(void)notifyTaskEnded:(SelfWorld *)vm
{
    [running removeObject:vm];
    [myTable reloadData];
}

// TableViewDataSource

- (id)tableView:(NSTableView *)tableView
   objectValueForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row {
    
        return [[running objectAtIndex:row] getName];
     
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [running count];
}

// TableViewDelagate

- (IBAction)tableViewSelected:(NSTableView *)tableView
{
    if ([tableView selectedRow] == -1) {
        [openTerminalButton setEnabled:NO];
        [forceQuitButton setEnabled:NO];
    } else {
        [openTerminalButton setEnabled:YES];
        [forceQuitButton setEnabled:YES];
    }
}

- (NSString*)nameOfSelectedWorld
{
    return [(SelfWorld*)[running objectAtIndex:[myTable selectedRow]] getNameForScreen];
}

// MANAGING

- (void)openTerminal:(NSNotification *)aNotification
{
    NSString *s = [NSString stringWithFormat:
                   @"tell application \"Terminal\" to do script \"screen -t Self -D -r %@\"", [self nameOfSelectedWorld]];
    NSAppleScript *as = [[NSAppleScript alloc] initWithSource: s];
    [as executeAndReturnError:nil];
    
    s = @"tell application \"Terminal\" to activate";
    as = [[NSAppleScript alloc] initWithSource: s];
    [as executeAndReturnError:nil];

    
}

- (void)forceQuit:(NSNotification *)aNotification
{
    [(SelfWorld*)[running objectAtIndex:[myTable selectedRow]] terminate];
}

// END MANAGING


@end
