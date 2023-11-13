//
//  SightingsAPI+Models.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 13.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

extension SightingsAPI {
    struct SightingsResponse: Decodable {
        let sightings: [SightingResponse]
    }

    struct SightingResponse: Decodable {
        let id: Int
        let name: String
        let description: String
        let picture: URL?
        let latitude: Double
        let longitude: Double
        let likesCount: Int
        let commentsCount: Int
    }
}
