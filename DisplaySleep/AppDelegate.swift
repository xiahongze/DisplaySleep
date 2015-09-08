//
//  AppDelegate.swift
//  DisplaySleep
//
//  Created by Hongze Xia on 7/09/2015.
//  Copyright (c) 2015 Hongze Xia. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-2)

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
//            button.action = Selector("printQuote:")
        }
        let menu = NSMenu()
//        menu.addItem(NSMenuItem(title: "Print Quote", action: Selector("printQuote:"), keyEquivalent: "P"))
        menu.addItem(NSMenuItem(title: "Sleep", action: Selector("putDisplayToSleep:"), keyEquivalent: "s"))
        menu.addItem(NSMenuItem(title: "Preference", action: Selector("showPreferenceWindow:"), keyEquivalent: ","))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(NSMenuItem(title: "Quit", action: Selector("terminate:"), keyEquivalent: "q"))
        statusItem.menu = menu
        // register defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let myDefaults = [ "launchAtStartup":0 ]
        defaults.registerDefaults(myDefaults)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

//    func printQuote(sender: AnyObject) {
//        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
//        let quoteAuthor = "Mark Twain"
//        
//        println("\(quoteText) — \(quoteAuthor)")
//    }
    
    func putDisplayToSleep(sender: AnyObject) {
        let task = NSTask()
        task.launchPath = "/usr/bin/pmset"
        task.arguments = ["displaysleepnow"]
        task.launch()
    }
    
    let preferenceController = Preference(windowNibName: "Preference")
    func showPreferenceWindow(sender: AnyObject) {
        preferenceController.showWindow(sender)
    }
    
}

