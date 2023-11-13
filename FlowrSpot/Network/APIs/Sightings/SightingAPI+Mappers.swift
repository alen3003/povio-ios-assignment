//
//  SightingAPI+Mappers.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 13.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

extension SightingsAPI {
    struct SightingsMapper: ModelMapper {
        static func transform(response: SightingsResponse) -> [Sighting]? {
            response.sightings.map {
                Sighting(
                    id: $0.id,
                    name: $0.name,
                    description: $0.description,
                    picture: $0.picture,
                    latitude: $0.latitude,
                    longitude: $0.longitude,
                    likesCount: $0.likesCount,
                    commentsCount: $0.commentsCount
                )
            }
        }
    }
}
