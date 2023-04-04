//
//  SideBarViewController.swift
//  CryptoMockDesignV1
//
//  Created by nikhil-pt6881 on 04/04/23.
//

import Foundation
import AppKit


//MARK: - SideBarViewController


class SideBarViewController: NSViewController {
    override func loadView() {
        self.view = NSView()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = .init(red: 147, green: 250, blue: 251, alpha: 0.8)
    }
}
