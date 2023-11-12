//
//  HostingNavigationController.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

class HostingNavigationController: UINavigationController {
    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        guard let hostingChild = children.last as? HostingNavigationConfigurable
        else {
            super.setNavigationBarHidden(hidden, animated: animated)
            return
        }

        super.setNavigationBarHidden(hostingChild.shouldHideNavigationBar, animated: animated)
    }
}

protocol HostingNavigationConfigurable: AnyObject {
    var shouldHideNavigationBar: Bool { get }
}
