//
//  SettingViewController.swift
//  DisplaySleep
//
//  Created by Hongze Xia on 7/09/2015.
//  Copyright (c) 2015 Hongze Xia. All rights reserved.
//
// Calling Apple Script to set login item for this App


import Cocoa

func isAppInLoginItems () -> Int {
    let cmd = "tell application \"System Events\"\n" +
            "set loginItems to the name of every login item\n" +
            "if \"DisplaySleep\" is not in loginItems then\n" +
            "return 0\n" +
            "else\n" +
            "return 1\nend if\nend tell"
    let result = runAppleScript(cmd)
    var j = result.stringValue?.toInt()
    return j!
}

func runAppleScript (cmd: String) -> NSAppleEventDescriptor {
    let myAppleScript = NSAppleScript(source: cmd)
    let result = myAppleScript?.executeAndReturnError(nil)
//    println(result?.description)
    return result!
}

class SettingViewController: NSViewController {
    
    @IBOutlet weak var checkButton: NSButton!
    
    let path = NSBundle.mainBundle().bundlePath
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        checkButton.state = isAppInLoginItems()
    }
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func checkOrUncheck(sender: NSButton) {
//        println(sender.state)
        let currentState = isAppInLoginItems()
        if currentState == 1 && sender.state == 0 {
            self.removeLoginItem()
        }
        else if currentState == 0 && sender.state == 1 {
            self.addLoginItem()
        }
        else {
            println("I don't know what you mean")
        }
    }
    
    func removeLoginItem () {
        let cmd = "tell application \"System Events\" to delete login item \"DisplaySleep\""
        runAppleScript(cmd)
    }
    
    func addLoginItem () {
        let cmd = "tell application \"System Events\" to make login item at end with properties {path:\"\(self.path)\", hidden:false}"
        runAppleScript(cmd)
    }

}
