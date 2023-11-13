//
//  SightingListItemView.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import SwiftUI

struct SightingListItemView: View {
    let sighting: Sighting

    var body: some View {
        VStack(spacing: 20) {
            RemoteImage(url: sighting.picture)
                .frame(maxWidth: .infinity)
                .frame(height: 280)
            UserInfoView()
            Text("Description")
            Divider()
                .background(Color(uiColor: .flowrGray))
        }
    }
}

struct UserInfoView: View {
    var body: some View {
        HStack(spacing: 40) {
            RemoteImage(url: nil, placeholderImage: Image(systemName: "person.circle.fill"))
            VStack(spacing: 5) {
                Text("Balcony Flower")
                    .font(Font(UIFont.custom(type: .regular, size: 15)))
                    .foregroundStyle(Color(uiColor: .flowrDarkGray))
                Text("by Adam Moore")
                    .font(Font(UIFont.custom(type: .italic, size: 12)))
                    .foregroundStyle(Color(uiColor: .flowrGray))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
    }
}
