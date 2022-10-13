//
//  AppDelegate.m
//  HelloMacOS
//
//  Created by 이승준 on 2022/10/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSTextField *inputField;
@property (weak) IBOutlet NSTextFieldCell *inputTextField;

@property (weak) IBOutlet NSTextFieldCell *userLabel;
@property (weak) IBOutlet NSButton *button;

- (IBAction)pressButton:(id)sender;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)pressButton:(id)sender {
    NSString *userInput = self.inputTextField.title;
    
    [self.userLabel setTitle: userInput];
    [self.button setTitle: @"Hi"];
    
    // 음성합성기로 소리도 들어보자
    NSSpeechSynthesizer *speechSynth = [[NSSpeechSynthesizer alloc] init];
    [speechSynth startSpeakingString: userInput];
}
@end
