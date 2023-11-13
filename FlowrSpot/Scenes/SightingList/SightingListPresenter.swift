//
//  SightingListPresenter.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

final class SightingListPresenter: ObservableObject {
    @Published private(set) var sightings: Result<[Sighting], Error> = .success([])

    private let interactor: SightingListInteractorInterface

    init(interactor: SightingListInteractorInterface) {
        self.interactor = interactor
    }

    func fetchSightings() {
        interactor
            .fetchSightings()
            .observe { [weak self] in self?.sightings = $0 }
    }
}
