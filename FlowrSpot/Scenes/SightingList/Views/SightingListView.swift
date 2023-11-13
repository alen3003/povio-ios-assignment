//
//  SightingListView.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import SwiftUI

struct SightingListView: View {
    @ObservedObject var presenter: SightingListPresenter

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                switch presenter.sightings {
                case .success(let sightings):
                    Section {
                        ForEach(sightings) {
                            SightingListItemView(sighting: $0)
                        }
                    } header: {
                        SightingListHeaderView(sightingCount: sightings.count)
                    }
                case .failure(let error):
                    Text(error.localizedDescription)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(perform: presenter.fetchSightings)
    }
}
