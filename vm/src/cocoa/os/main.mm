/* Notes on Cocoa/Carbon integration.
 * Self UI2 written in Carbon.
 * Self console should be written in Cocoa.
 * Should the Self app be a Cocoa or a Carbon app?
 * a) if it's a Carbon app, then we have to do the funny bundle-loading.  I've almost got that
 *    done, just need a bit more time.  NEEDS TO BE INVESTIGATED FURTHER.
 * b) I'd rather have Self be a Cocoa app, because then there's no need for funny bundle-loading,
 *    and I can have just one Self VM target, rather than a Self VM target and a Cocoa console
 *    bundle.
 *    With a Cocoa app, I have two choices:  whether the main thread executes the VM and another
 *    thread executes Cocoa, or the other way around.  However, in the main-thread-executes-Cocoa
 *    case, the VM is extremely slow.  So I'm "forced" to make the main thread execute the VM,
 *    and another thread execute Cocoa.  Not that there's anything wrong with it.
 *
 *    Unfortunately, when I do this, things are going fine in the Self world, but the (Cocoa) console
 *    doesn't accept input.  It seems the Cocoa console window is not receiving its events properly.
 *    Update:  I think I know the reason why.  See the "Run Loops" programming topics document.
 *    It seems that when you create a new thread, its run loop doesn't automatically check for inupt
 *    events.
 *
 *    Maybe use an NSThread, rather than a pthread directly?  Update:  nope, doesn't make a difference.
 *
 *    One other option is to change the event model of the VM, so that we don't need multiple threads.
 *    In the run_the_VM function, rather than have an "infinite for loop", we can have a function that's
 *    called when "enter" is pressed.  And use a StringScanner, rather than an InteractiveScanner.
 *
 */

#undef ASSEMBLER
#import <Cocoa/Cocoa.h>
#include <pthread.h>
#include <unistd.h>
#include "SelfConsole.h"

extern int old_main(int argc, char *argv[]);


void startCocoa(MainArgs* args, bool fork) {
    NSAutoreleasePool *localPool;
    localPool = [[NSAutoreleasePool alloc] init];
    SelfConsole* console = [SelfConsole alloc];
    if (fork) {
      [NSThread detachNewThreadSelector: @selector(startCocoaConsole:) toTarget: console withObject: (id)args];
    }
    else {
      [console startCocoaConsole: args];
    }
    [localPool release];
}


void startVM(MainArgs* args, bool fork) {
    NSAutoreleasePool *localPool;
    localPool = [[NSAutoreleasePool alloc] init];
    SelfVMStarter* vmStarter = [SelfVMStarter alloc];
    if (fork) {
      [NSThread detachNewThreadSelector: @selector(startSelfVM:) toTarget: vmStarter withObject: (id)args];
    }
    else {
      [vmStarter startSelfVM: args];
    }
    [localPool release];
}

@implementation SelfVMStarter

- (void) startSelfVM: (MainArgs*) args {
    old_main(args->argc, args->argv);
}

@end


int main(int argc, char *argv[])
{
    MainArgs* args = [[MainArgs alloc] initWithArgc: argc argv: argv];

    startVM(args, true);
    startCocoa(args, false);
//    NSApplicationMain(argc, (const char**)argv);


    return 0;
}