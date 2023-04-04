////
////  ViewController.swift
////  CryptoMockDesignV1
////
////  Created by nikhil-pt6881 on 04/04/23.
////
//
//import Cocoa
//
//class ViewController: NSViewController {
//
//    var mainView : NSView {
//        let view = NSView()
//        view.wantsLayer = true
//        view.layer?.backgroundColor = NSColor.gray.cgColor
//        return view
//    }
//    var splitView : NSSplitView = NSSplitView()
//    var leftSideBarView : NSView = NSView()
//    var contentView : NSView =  NSView()
//    var rightSideBarView : NSView = NSView()
//    private var leftSideBarConstraint: NSLayoutConstraint!
//    private var rightSideBarConstraint: NSLayoutConstraint!
//
//
//    override func loadView() {
//        view = mainView
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureLeftSideBarView()
//        configureContentView()
//        configureRightSideBarView()
//        configureSplitView()
//        configureConstraints()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override var representedObject: Any? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }
//
//}
//
//extension ViewController {
//
//    func configureLeftSideBarView(){
//        leftSideBarView.wantsLayer = true
//        leftSideBarView.layer?.backgroundColor = NSColor.systemTeal.cgColor
//    }
//    func configureContentView(){
//        contentView.wantsLayer = true
//        contentView.layer?.backgroundColor = NSColor.systemGray.cgColor
//    }
//    func configureRightSideBarView(){
//        rightSideBarView.wantsLayer = true
//        rightSideBarView.layer?.backgroundColor = NSColor.systemRed.cgColor
//    }
//
//    func configureSplitView(){
//        splitView.dividerStyle = .thick
//        splitView.isVertical = true
//        splitView.addArrangedSubview(leftSideBarView)
//        splitView.addArrangedSubview(contentView)
//        splitView.addArrangedSubview(rightSideBarView)
//        
//        view.addSubview(splitView)
//
//    }
//
//    func configureConstraints(){
//        splitView.translatesAutoresizingMaskIntoConstraints = false
//        leftSideBarView.translatesAutoresizingMaskIntoConstraints = false
//        rightSideBarView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//
//        // For SplitView relative to Mainview -> Window
//        NSLayoutConstraint.activate([
//            splitView.topAnchor.constraint(equalTo: view.topAnchor),
//            splitView.rightAnchor.constraint(equalTo: view.rightAnchor),
//            splitView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            splitView.leftAnchor.constraint(equalTo: view.leftAnchor),
//        ])
//
//        // For Left SideBar relative to splitview %
//
//
//        leftSideBarConstraint = leftSideBarView.widthAnchor.constraint(equalToConstant: 150)
//        rightSideBarConstraint = rightSideBarView.widthAnchor.constraint(equalToConstant: 300)
//        leftSideBarConstraint.isActive = true
//        rightSideBarConstraint.isActive = true
//
//
//
//
//
//    }
//}


