//
//  SightingListInteractor.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 13.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

protocol SightingListInteractorInterface {
    func fetchSightings() -> Promise<[Sighting]>
}

final class SightingListInteractor {
    private let sightingsAPI: SightingsAPI

    init(sightingsAPI: SightingsAPI) {
        self.sightingsAPI = sightingsAPI
    }
}

extension SightingListInteractor: SightingListInteractorInterface {
    func fetchSightings() -> Promise<[Sighting]> {
        sightingsAPI
            .fetchSightingsList()
    }
}
