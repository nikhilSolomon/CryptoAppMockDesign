//
//  ContentViewController.swift
//  CryptoMockDesignV1
//
//  Created by nikhil-pt6881 on 04/04/23.
//

import Foundation
import AppKit



class ContentViewController: NSViewController {
    override func loadView() {
        self.view = NSView()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = .init(red: 238, green: 243, blue: 245, alpha: 0.5)
    }
}
