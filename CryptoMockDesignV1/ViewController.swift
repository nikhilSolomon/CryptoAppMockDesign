//
//  ViewController.swift
//  CryptoMockDesignV1
//
//  Created by nikhil-pt6881 on 04/04/23.
//

import Cocoa

class ViewController: NSViewController {
    
    var mainView : NSView {
        let view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.gray.cgColor
        return view
    }
    var splitView : NSSplitView = NSSplitView()
    var leftSideBarView : NSView = NSView()
    var contentView : NSView =  NSView()
    var rightSideBarView : NSView = NSView()
    private var leftSideBarConstraint: NSLayoutConstraint!
    private var rightSideBarConstraint: NSLayoutConstraint!
    

    override func loadView() {
        view = mainView
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLeftSideBarView()
        configureContentView()
        configureRightSideBarView()
        configureSplitView()
        configureConstraints()
    
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
   
}

extension ViewController {
    
    func configureLeftSideBarView(){
        leftSideBarView.wantsLayer = true
        leftSideBarView.layer?.backgroundColor = NSColor.systemTeal.cgColor
    }
    func configureContentView(){
        contentView.wantsLayer = true
        contentView.layer?.backgroundColor = NSColor.systemGray.cgColor
    }
    func configureRightSideBarView(){
        rightSideBarView.wantsLayer = true
        rightSideBarView.layer?.backgroundColor = NSColor.systemRed.cgColor
    }
    
    func configureSplitView(){
        splitView.dividerStyle = .thick
        splitView.isVertical = true
        splitView.addArrangedSubview(leftSideBarView)
        splitView.addArrangedSubview(contentView)
        splitView.addArrangedSubview(rightSideBarView)
        
        view.addSubview(splitView)
        
    }
    
    func configureConstraints(){
        splitView.translatesAutoresizingMaskIntoConstraints = false
        leftSideBarView.translatesAutoresizingMaskIntoConstraints = false
        rightSideBarView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        // For SplitView relative to Mainview -> Window
        NSLayoutConstraint.activate([
            splitView.topAnchor.constraint(equalTo: view.topAnchor),
            splitView.rightAnchor.constraint(equalTo: view.rightAnchor),
            splitView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            splitView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
        
        // For Left SideBar relative to splitview %
        

        leftSideBarConstraint = leftSideBarView.widthAnchor.constraint(equalToConstant: 150)
        rightSideBarConstraint = rightSideBarView.widthAnchor.constraint(equalToConstant: 300)
        leftSideBarConstraint.isActive = true
        rightSideBarConstraint.isActive = true
    
        
        
        
        
    }
}



extension ViewController :  NSToolbarDelegate  {
    
    //Asks the delegate for the toolbar item associated with the specified identifier.
    func toolbar(_ toolbar: NSToolbar,
                 itemForItemIdentifier itemIdentifier: NSToolbarItem.Identifier,
                 willBeInsertedIntoToolbar flag: Bool) -> NSToolbarItem? {
        let configuration = NSImage.SymbolConfiguration(pointSize: 20, weight: NSFont.Weight.regular, scale: NSImage.SymbolScale.small)
        if itemIdentifier == NSToolbarItem.Identifier("SplitView") {
            // SF Symbol Icon configuration
            let toolBarView: NSView = NSView()
            
            
            let leftIconImage = NSImage(systemSymbolName: "sidebar.left", accessibilityDescription: nil)?.withSymbolConfiguration(configuration)
            let rightIconImage = NSImage(systemSymbolName: "sidebar.right", accessibilityDescription: nil)?.withSymbolConfiguration(configuration)
            
            
            let leftIcon = NSButton(image: leftIconImage!, target: self, action: #selector(toggleLeftSidebar))
            leftIcon.contentTintColor = .black
            let rightIcon = NSButton(image: rightIconImage!, target: self, action: #selector(toggleRightSidebar))
            rightIcon.contentTintColor = .black
            
            leftIcon.isBordered = false
            rightIcon.isBordered = false
            
            toolBarView.addSubview(leftIcon)
            toolBarView.addSubview(rightIcon)
            
            leftIcon.translatesAutoresizingMaskIntoConstraints = false
            rightIcon.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                leftIcon.leftAnchor.constraint(equalTo: toolBarView.leftAnchor),
                leftIcon.centerYAnchor.constraint(equalTo: toolBarView.centerYAnchor),
                leftIcon.widthAnchor.constraint(equalToConstant: 30),
                rightIcon.leftAnchor.constraint(greaterThanOrEqualTo: leftIcon.rightAnchor),
                rightIcon.rightAnchor.constraint(equalTo: toolBarView.rightAnchor),
                rightIcon.centerYAnchor.constraint(equalTo: toolBarView.centerYAnchor),
                rightIcon.widthAnchor.constraint(equalToConstant: 30)
            ])
            
            let toolBarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
            toolBarItem.paletteLabel = "SplitView"
            toolBarItem.visibilityPriority = .high
            toolBarItem.isBordered = false
            toolBarItem.isNavigational = true
            toolBarItem.view = toolBarView
            return toolBarItem
        }
        
        if  itemIdentifier == NSToolbarItem.Identifier("Mute") {
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
            toolbarItem.target = self
            toolbarItem.action = #selector(toggleTitlebarAccessory)
            toolbarItem.label = "Mute"
            toolbarItem.paletteLabel = "Mute"
            toolbarItem.toolTip = "Mute Notifications"
            toolbarItem.visibilityPriority = .low
            //toolbarItem.isBordered = isBordered
            toolbarItem.image = NSImage(systemSymbolName: "speaker.slash", accessibilityDescription: "")?.withSymbolConfiguration(configuration)
            return toolbarItem
        }
        
        if  itemIdentifier == NSToolbarItem.Identifier("AccountsSettings") {
            let toolbarItem = NSToolbarItem(itemIdentifier: itemIdentifier)
            toolbarItem.target = self
            toolbarItem.action = #selector(toggleTitlebarAccessory)
            toolbarItem.label = "AccountsSettings"
            toolbarItem.paletteLabel = "AccountsSettings"
            toolbarItem.toolTip = "AccountsSettings"
                // toolbarItem.isBordered = isBrdered
            toolbarItem.visibilityPriority = .low
            toolbarItem.image = NSImage(systemSymbolName: "person.circle", accessibilityDescription: "")?.withSymbolConfiguration(configuration)
            return toolbarItem
        }
        
        return nil
    }
    
    @objc
    func toggleTitlebarAccessory(){
        print("hi")
    }
    
    @objc
    func toggleLeftSidebar(){
        let isSidebarHidden = (leftSideBarConstraint.constant == 50)
        let newWidth: CGFloat = isSidebarHidden ? 150 : 50
        let animationDuration: TimeInterval = 0.25
        leftSideBarConstraint.constant = newWidth
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = animationDuration
            context.allowsImplicitAnimation = true
            splitView.layoutSubtreeIfNeeded()
        })
    }
    
    @objc
    func toggleRightSidebar(){
        let isSidebarHidden = (rightSideBarConstraint.constant == 0.0)
        let newWidth: CGFloat = isSidebarHidden ? 300 : 0
        let animationDuration: TimeInterval = 0.25
        rightSideBarConstraint.constant = newWidth
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = animationDuration
            context.allowsImplicitAnimation = true
            splitView.layoutSubtreeIfNeeded()
        })
    }

    
    

    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [NSToolbarItem.Identifier("SplitView"),NSToolbarItem.Identifier("Mute"),NSToolbarItem.Identifier("AccountsSettings")]
    }
    
    func toolbarAllowedItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [NSToolbarItem.Identifier("SplitView"),NSToolbarItem.Identifier("Mute"),NSToolbarItem.Identifier("AccountsSettings")]
        
    }
}


extension ViewController : NSSplitViewDelegate {
    
     func splitViewWillResizeSubviews(_ notification: Notification) {
        print("didresize")
    }
    
    
}
