/*
    SelfConsoleView.m
    Self
 */
/*  Copyright 1992-2012 AUTHORS.
    See the LICENSE file for license information. */

#import "SelfConsoleView.h"

@interface SelfConsoleView (TextSink)
- (void) dataAvailable: (NSNotification*) aNotification;

@end

@implementation SelfConsoleView

@synthesize pty;

- (id) initWithCoder: (NSCoder*) aDecoder
{
  if (self = [super initWithCoder: aDecoder])
  {
    [self setFont:[NSFont userFixedPitchFontOfSize: 0.0]];
  }
  return self;
}

- (id) initWithFrame: (NSRect) frameRect textContainer: (NSTextContainer*) container
{
  if (self = [super initWithFrame: frameRect textContainer: container])
  {
    [self setFont:[NSFont userFixedPitchFontOfSize: 0.0]];
  }
  return self;
}

- (void) initPty: (Pty*) aPseudoTTY
{
  [self setPty: aPseudoTTY];
  [self insertText: 
   [NSString stringWithFormat: @"Interaction on %@\n", [pty name]]];

  [[NSNotificationCenter defaultCenter]
             addObserver: self
                selector: @selector(dataAvailable:)
                    name: NSFileHandleReadCompletionNotification
                  object: [pty master]];

  [[pty master] readInBackgroundAndNotify];
}

- (void) dealloc
{
  if (pty) {
    [[NSNotificationCenter defaultCenter] 
            removeObserver: self
                      name: NSFileHandleReadCompletionNotification 
                    object: [pty master]];
    [pty release]; 
  }
  [super dealloc];
}

- (void) keyDown: (NSEvent*) anEvent
{
  if (pty) {
    const char* input = [[anEvent characters] UTF8String];
    [[pty master] writeData: [NSData dataWithBytes: input 
                                            length: strlen(input)]];
  } else {
    [super keyDown: anEvent];
  }
}


@end

@implementation SelfConsoleView (TextSink)

- (void) dataAvailable: (NSNotification*) aNotification
{
  NSData* receivedData = [[aNotification userInfo]
                          objectForKey: NSFileHandleNotificationDataItem];
  if (!receivedData || ([receivedData length] == 0)) {
    return;
  }
  
  NSString * str = [[NSString alloc] initWithData: receivedData 
                                         encoding: NSUTF8StringEncoding];
  [self insertText: str];
  [str release];
  
  [[aNotification object] readInBackgroundAndNotify];
}

@end