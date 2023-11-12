//
//  LazyHostingViewController.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import SwiftUI
import UIKit

class LazyHostingViewController<RootView: View>: UIViewController, HostingNavigationConfigurable {
    // swiftlint:disable implicitly_unwrapped_optional
    var rootView: RootView!
    private let isNavigationBarHidden: Bool

    var shouldHideNavigationBar: Bool { isNavigationBarHidden }

    init(isNavigationBarHidden: Bool = false) {
        self.isNavigationBarHidden = isNavigationBarHidden
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let hostingController = UIHostingController(rootView: rootView)

        hostingController.willMove(toParent: self)
        view.addSubview(hostingController.view)
        addChild(hostingController)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        hostingController.didMove(toParent: self)
    }
}
