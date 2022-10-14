//
//  AppDelegate.swift
//  HelloMacSwift
//
//  Created by 이승준 on 2022/10/13.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    
    @IBOutlet weak var mainLabel: NSTextFieldCell!
    @IBOutlet weak var userInputField: NSTextFieldCell!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


    @IBAction func buttonTapped(_ sender: Any) {
        mainLabel.title = userInputField.title
        
        let speechSynth = NSSpeechSynthesizer()
        speechSynth.startSpeaking(userInputField.title)
    }
}

