//
//  SightingListInteractor.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 13.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

protocol SightingListInteractorInterface {
    func fetchSightings(paginator: PaginatedResult) -> Promise<[Sighting]>
}

final class SightingListInteractor {
    private let sightingsAPI: SightingsAPI

    init(sightingsAPI: SightingsAPI) {
        self.sightingsAPI = sightingsAPI
    }
}

extension SightingListInteractor: SightingListInteractorInterface {
    func fetchSightings(paginator: PaginatedResult) -> Promise<[Sighting]> {
        sightingsAPI
            .fetchSightingsList(pageNumber: paginator.currentPage)
            .handle(with: paginator)
    }
}

private extension Promise where Value == SightingsAPI.SightingsResponse {
    func handle(with paginator: PaginatedResult) -> Promise<[Sighting]> {
        tap {
            paginator.setShouldFetchNextPage(totalPages: $0.meta.pagination.totalPages)
            paginator.increaseCurrentPage()
        }
        .compactMap(with: SightingsAPI.SightingsMapper.transform)
    }
}
