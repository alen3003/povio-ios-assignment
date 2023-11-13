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
                    } footer: {
                        addNewSightingButton
                    }
                case .failure(let error):
                    Text(error.localizedDescription)
                }
            }
        }
        .background(Color.white.ignoresSafeArea())
        .onAppear(perform: presenter.fetchSightings)
    }

    @ViewBuilder
    private var addNewSightingButton: some View {
        Button(
            action: { presenter.addNewSighting() },
            label: {
                Text("+ Add New Sighting")
                    .font(Font(UIFont.custom(type: .regular, size: 15)))
            }
        )
        .frame(width: 200, height: 48)
        .background(Color(UIColor.flowrPink))
        .padding([.top, .bottom], 25)
        .buttonStyle(.plain)
    }
}
