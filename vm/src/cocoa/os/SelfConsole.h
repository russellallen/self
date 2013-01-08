#undef ASSEMBLER
#import <AppKit/AppKit.h>


@interface MainArgs : NSObject {
@public
  int    argc;
  char **argv;
}
- (MainArgs*) initWithArgc: (int)argc argv: (char**)argv;
@end




extern void startCocoa(MainArgs* args, bool fork);



@interface SelfConsole : NSObject {
    unsigned int newCommandIndex; // first character index of of current command string
    unsigned int lastTextLength;  // needed to detect an "enter" pressed in an "illegal" position
    IBOutlet NSTextView* textView;
}

- (void) startCocoaConsole: (MainArgs*)args;  // this method doesn't belong here.

- (void) appendString: (const char *) cString;

- (BOOL)textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector;
- (BOOL)textView:(NSTextView *)aTextView shouldChangeTextInRange:(NSRange)affectedCharRange replacementString:(NSString *)replacementString;

@end

@interface SelfVMStarter : NSObject {
}
- (void) startSelfVM: (MainArgs*)args;
@end