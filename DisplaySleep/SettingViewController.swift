//
//  SettingViewController.swift
//  DisplaySleep
//
//  Created by Hongze Xia on 7/09/2015.
//  Copyright (c) 2015 Hongze Xia. All rights reserved.
//

import Cocoa

class SettingViewController: NSViewController {
    
    @IBOutlet weak var checkButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        checkButton.state = defaults.dictionaryRepresentation()["launchAtStartup"] as! Int
    }
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBAction func checkOrUncheck(sender: NSButton) {
        println(sender.state)
        defaults.setInteger(sender.state, forKey: "launchAtStartup")
    }

}
