//
//  PaginatedResult.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 14.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

class PaginatedResult {
    // Tells if all items have been loaded
    var shouldFetchNextPage: Bool

    // Tracks last page loaded. Used to load next page (current + 1)
    var currentPage: Int

    // Total number of pages
    var totalPages: Int = 0

    // Limit of items per page
    let itemsPerPage: Int

    init(startingPage: Int, itemsPerPage: Int) {
        self.shouldFetchNextPage = false
        self.currentPage = startingPage
        self.itemsPerPage = itemsPerPage
    }

    func increaseCurrentPage() {
        currentPage += 1
    }

    func setShouldFetchNextPage(totalPages: Int) {
        self.totalPages = totalPages
        shouldFetchNextPage = totalPages != currentPage
    }
}
