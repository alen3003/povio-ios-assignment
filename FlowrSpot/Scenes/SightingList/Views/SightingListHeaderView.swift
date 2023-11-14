//
//  SightingListHeaderView.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import SwiftUI

struct SightingListHeaderView: View {
    let sightingsCount: Int

    var body: some View {
        VStack(spacing: 13) {
            Text("sighting_list".localized())
                .font(Font(UIFont.custom(type: .regular, size: 24)))
            Text("explore_sightings".localized(sightingsCount))
                .font(Font(UIFont.custom(type: .regular, size: 12)))
        }
        .foregroundStyle(Color(uiColor: .flowrGray))
        .frame(height: 120)
        .frame(maxWidth: .infinity)
    }
}
