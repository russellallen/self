#import "SelfConsole.h"


@implementation MainArgs

- (MainArgs*) initWithArgc: (int)argc2 argv: (char**)argv2 {
    argc = argc2;
    argv = argv2;
    return self;
}

@end


@implementation SelfConsole


- (void) startCocoaConsole: (MainArgs*)args {  // XXX: this method doesn't belong here.
    NSApplicationMain(args->argc, (const char**)args->argv);
}

- (BOOL)textView:(NSTextView *)aTextView doCommandBySelector:(SEL)commandSelector {
    BOOL retval = NO;
    if (@selector(insertNewline:) == commandSelector) {
        unsigned int textLength = [[aTextView string] length];
        NSRange newCommandStringRange = NSMakeRange(newCommandIndex, textLength - newCommandIndex);
        NSAttributedString* newCommandANString = [aTextView attributedSubstringFromRange: newCommandStringRange];
        NSString*           newCommandString   = [newCommandANString string];
        printf("New command = %s\n", [newCommandString cString]);
        [self appendString: "\n"];
        lastTextLength = newCommandIndex = textLength + 1; // skip the newline character
        retval = YES;
    }
    return retval;
}

- (BOOL)textView:(NSTextView *)aTextView shouldChangeTextInRange:(NSRange)affectedCharRange replacementString:(NSString *)replacementString {
    // only allow changes to current input
    return affectedCharRange.location >= newCommandIndex;
}


- (void) appendString: (const char *) cString {
    NSString*            nsString = [NSString stringWithCString: cString];
    NSAttributedString* ansString = [[NSAttributedString alloc] initWithString: nsString];
    [[textView textStorage] appendAttributedString: ansString];
}


@end