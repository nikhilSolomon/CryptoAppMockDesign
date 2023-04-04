//
//  RightSideBarViewController.swift
//  CryptoMockDesignV1
//
//  Created by nikhil-pt6881 on 04/04/23.
//

import Foundation

import AppKit


class RightSideBarViewController: NSViewController {
    override func loadView() {
        self.view = NSView()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.blue.cgColor
    }
}
