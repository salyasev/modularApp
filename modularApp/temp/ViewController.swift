//
//  ViewController.swift
//  temp
//
//  Created by Sergey Alyasev on 10/10/2017.
//  Copyright © 2017 Convergent Media Group. All rights reserved.
//

import UIKit

// MARK: 1
// Other way via framworks
// https://novemberfive.co/blog/modular-apps-ios/



class ViewController: UIViewController {

    // MARK: 2
    // ModuleA.swift & ModuleB.swift files implement the ModuleInterface protocol
    // ModuleA.swift has target membership for temp-A ONLY
    // ModuleB.swift has target membership for temp-B ONLY
    // ModuleInterface has target membership for temp-A & temp-B
    // IMHO: it is the same as we will create factory for classes based on defines MODULE_A & MODULE_B
    private let module: ModuleInterface! = Module()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 3
        // set Other linker flag for swift
        // '-D MODULE_A' for temp-A
        // '-D MODULE_B' for temp-B
        #if MODULE_A
            print("module A")
        #endif
        
        #if MODULE_B
            print("module B")
        #endif
        
        
        // MARK: 4
        // Get data from plist files
        // No need target membership for Info-A.plist & Info-B.plist
        // It will add automatically based on build settings for scheme.
        if let plistInfo = Bundle.main.infoDictionary {
            print("from plist: \(plistInfo["Test"] as! String)")
        } else {
            print("plist loading issue.")
        }
        
        // MARK: 5
        // see MARK 2:
        print("module name: \(module.moduleName)")
        
        // MARK: 6
        // if we use cocoapods we can set different pods for different schemes
        
        // MARK: 7
        // we can set different assets, storyboards, compile files, plist files, settings for different schemes
    }
}

