/*
   Pty.m
   Self
 */
/* Copyright 1992-2012 AUTHORS.
   See the LICENSE file for license information. */

#import "Pty.h"
#include <util.h>
#include <sys/ioctl.h>
#include <unistd.h>

@implementation Pty

@synthesize name;
@synthesize master;
@synthesize slave;


- (id) init
{
  if (self = [super init]) {
    int fdMaster, fdSlave;
    char device[64];

    // open pty
    if (openpty(&fdMaster, &fdSlave, device, NULL, NULL) != 0) {
      [NSException raise: @"CannotOpenPtyErrorException" 
                  format: @"%s (%s:%d)", strerror(errno), __FILE__, __LINE__];
    }  
    name = [NSString stringWithCString: device encoding: NSUTF8StringEncoding];
    slave = [[NSFileHandle alloc] initWithFileDescriptor: fdSlave];
    master = [[NSFileHandle alloc] initWithFileDescriptor: fdMaster
                                           closeOnDealloc: YES];
    // become session master.
    if (setsid() < 0) {
      if (errno != EPERM) { // EPERM is ok, we may already own the session.
        [NSException raise: @"CannotCreateSessionErrorException" 
                    format: @"%s (%s:%d)", strerror(errno), __FILE__, __LINE__];
      }
    }

    // become controlling terminal
    if (ioctl(fdSlave, TIOCSCTTY, NULL) < 0) {
      if (errno != EPERM) { // EPERM is ok, we may already have a controlling term.
        [NSException raise: @"CannotControlTerminalErrorException" 
                    format: @"%s (%s:%d)", strerror(errno), __FILE__, __LINE__];
      }
    }
  }
  return self;
}

- (void) dealloc
{
  [name   release];
  [master release];
  [slave  release];
  [super dealloc];
}
@end
