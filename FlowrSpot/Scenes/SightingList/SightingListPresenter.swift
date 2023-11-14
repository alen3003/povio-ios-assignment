//
//  SightingListPresenter.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

final class SightingListPresenter: ObservableObject {
    private let interactor: SightingListInteractorInterface
    private let paginator = PaginatedResult(startingPage: 1, itemsPerPage: 20)

    @Published private(set) var sightings: Result<[Sighting], Error> = .success([])

    private var values: [Sighting] {
        if case .success(let values) = sightings { return values }
        return []
    }

    var totalResults: Int {
        (paginator.totalPages - 1) * paginator.itemsPerPage
    }

    init(interactor: SightingListInteractorInterface) {
        self.interactor = interactor
    }

    func fetchSightings() {
        interactor
            .fetchSightings(paginator: paginator)
            .observe { [weak self, values] result in
                switch result {
                case .success(let sightings):
                    self?.sightings = .success(values + sightings)
                case .failure(let error):
                    self?.sightings = .failure(error)
                }
            }
    }

    func didShow(item: Sighting) {
        guard item.id == values.last?.id else { return }
        guard paginator.shouldFetchNextPage else { return }
        fetchSightings()
    }

    func addNewSighting() {
        // TODO: Implement addNewSighting
    }
}
