//
//  AppDelegate.swift
//  CryptoMockDesignV1
//
//  Created by nikhil-pt6881 on 04/04/23.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {

    
    var homeWindow : NSWindow?
    var CurerntViewController : NSViewController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        setUpWindow()
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    func setUpWindow(){
        CurerntViewController = ViewController()
        homeWindow = HomeWindow(viewController: CurerntViewController! as! ViewController)
        homeWindow?.makeKeyAndOrderFront(nil)
    }


}

