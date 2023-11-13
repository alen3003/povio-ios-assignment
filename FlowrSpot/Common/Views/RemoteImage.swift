//
//  RemoteImage.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import SwiftUI

struct RemoteImage<Placeholder: View>: View {
    var url: URL?
    var placeholderImage: Placeholder?

    var body: some View {
        AsyncImage(
            url: url,
            content: { $0.resizable() },
            placeholder: { placeholderImage }
        )
    }
}

extension RemoteImage where Placeholder == SwiftUI.EmptyView {
    init(url: URL?) {
        self.init(url: url, placeholderImage: Optional<SwiftUI.EmptyView>.none)
    }
}
