/*
    Pty.h
    Self
 */
/*  Copyright 1992-2012 AUTHORS.
    See the LICENSE file for license information. */

#undef ASSEMBLER
#import <Foundation/Foundation.h>

@interface Pty : NSObject
{
  NSString*     name;
  NSFileHandle* master;
  NSFileHandle* slave;
}

@property (nonatomic, retain) NSString*     name;
@property (nonatomic, retain) NSFileHandle* master;
@property (nonatomic, retain) NSFileHandle* slave;

@end
