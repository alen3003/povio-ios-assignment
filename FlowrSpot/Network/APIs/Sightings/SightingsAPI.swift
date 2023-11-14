//
//  SightingsAPI.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 13.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation
import PovioKitNetworking

class SightingsAPI {
    private let client: AlamofireNetworkClient

    init(client: AlamofireNetworkClient = .default) {
        self.client = client
    }

    func fetchSightingsList(pageNumber: Int) -> Promise<SightingsResponse> {
        client
            .request(
                method: .get,
                endpoint: Endpoints.list,
                parameters: ["page": pageNumber],
                parameterEncoding: URLEncoding.queryString
            )
            .validate()
            .decode(SightingsResponse.self, decoder: .default)
    }
}
