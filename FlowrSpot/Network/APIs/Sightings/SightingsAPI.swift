//
//  SightingsAPI.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 13.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

class SightingsAPI {
    private let client: AlamofireNetworkClient

    init(client: AlamofireNetworkClient = .default) {
        self.client = client
    }

    func fetchSightingsList() -> Promise<[Sighting]> {
        client
            .request(method: .get, endpoint: Endpoints.list)
            .validate()
            .decode(SightingsResponse.self, decoder: .default)
            .compactMap(with: SightingsMapper.transform)
    }
}
