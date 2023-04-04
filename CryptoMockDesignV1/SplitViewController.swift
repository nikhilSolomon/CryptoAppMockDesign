//
//  SplitViewController.swift
//  CryptoMockDesignV1
//
//  Created by nikhil-pt6881 on 04/04/23.
//

import Foundation
import AppKit

class SplitViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the child view controllers
//        let leftViewController = LeftViewController()
//        let rightViewController = RightViewController()

        // Set the child view controllers as the split view items
        splitViewItems = [
            NSSplitViewItem(viewController: leftViewController),
            NSSplitViewItem(viewController: rightViewController)
        ]
    }

}

