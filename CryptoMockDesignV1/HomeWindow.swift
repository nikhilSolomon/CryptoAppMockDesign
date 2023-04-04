//
//  HomeWindow.swift
//  CryptoMockDesignV1
//
//  Created by nikhil-pt6881 on 04/04/23.
//

import Foundation

import AppKit




class HomeWindow: NSWindow {
    
    var viewController: NSViewController
    
        init(viewController: NSViewController) {
            
        self.viewController = viewController
        
          
           // 1512.0 982.0
            super.init(contentRect: NSMakeRect(0, 0, 0, 0),
                       styleMask: [.titled, .closable, .miniaturizable,.resizable],
                   backing: .buffered,
                   defer: false)
            //self.minSize = NSSize(width:viewPort.width*0.4, height: viewPort.height*0.5)
//            self.maxSize = NSSize(width:viewPort.width*0.4, height: viewPort.height*0.5)

        configureWindow()
        configureToolbar()
    }
    
    func configureWindow(){
        var viewPort: CGSize {
            get {
                if let mainScreen = NSScreen.main {
                    return mainScreen.frame.size
                }else{
                    print("Error finding view port")
                    return CGSize.zero
                }
            }
        }
//        print(viewPort.width,viewPort.height)

        self.contentViewController = viewController
        self.title = "Crypto Simulator"
        self.titleVisibility = .hidden
        self.titlebarAppearsTransparent = true
       // self.titlebarSeparatorStyle = .line
        self.toolbarStyle = .unified // check
        self.backgroundColor = .init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.setContentSize(NSSize(width: viewPort.width, height: viewPort.height))


    }
    
}

extension HomeWindow {
    
    private func configureToolbar() {
            
        let newToolbar = CustomToolBar(identifier: NSToolbar.Identifier(stringLiteral: "customTool"))
            newToolbar.allowsUserCustomization = true
            newToolbar.autosavesConfiguration = true
            newToolbar.displayMode = .default
        newToolbar.delegate = viewController as? any NSToolbarDelegate
            self.toolbar = newToolbar
            self.toolbar?.validateVisibleItems()
        
    }

}

