//
//  Preference.swift
//  DisplaySleep
//
//  Created by Hongze Xia on 7/09/2015.
//  Copyright (c) 2015 Hongze Xia. All rights reserved.
//

import Cocoa



class Preference: NSWindowController {
    let settingViewController = SettingViewController(nibName: "SettingViewController", bundle: NSBundle.mainBundle())
    let aboutViewController = AboutViewController(nibName: "AboutViewController", bundle: NSBundle.mainBundle())
//    @IBOutlet var preferenceWindow: NSWindow!
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        settingClicked("sender")
    }

    @IBOutlet weak var myView: NSView!

    @IBAction func settingClicked(sender: AnyObject) {
        myView.subviews = [settingViewController!.view]
//        myView.addSubview(settingViewController!.view)
//        myViewController.view.setFrameSize
    }
    @IBAction func aboutClicked(sender: AnyObject) {
        myView.subviews = [aboutViewController!.view]
    }
    
}
