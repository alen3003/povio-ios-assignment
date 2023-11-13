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
        let flower: Flower
        let user: User

        enum CodingKeys: CodingKey {
            case id
            case name
            case description
            case picture
            case latitude
            case longitude
            case likesCount
            case commentsCount
            case flower
            case user
        }

        init(from decoder: Decoder) throws {
            let container: KeyedDecodingContainer<SightingsAPI.SightingResponse.CodingKeys> = try decoder.container(
                keyedBy: SightingsAPI.SightingResponse.CodingKeys.self
            )
            self.id = try container.decode(Int.self, forKey: SightingsAPI.SightingResponse.CodingKeys.id)
            self.name = try container.decode(String.self, forKey: SightingsAPI.SightingResponse.CodingKeys.name)
            self.description = try container.decode(String.self, forKey: SightingsAPI.SightingResponse.CodingKeys.description)
            let pictureUrl = try container.decodeIfPresent(String.self, forKey: SightingsAPI.SightingResponse.CodingKeys.picture)
                .map { $0.hasPrefix("https") ? $0 : "https:\($0)" }
            self.picture = URL(string: pictureUrl)
            self.latitude = try container.decode(Double.self, forKey: SightingsAPI.SightingResponse.CodingKeys.latitude)
            self.longitude = try container.decode(Double.self, forKey: SightingsAPI.SightingResponse.CodingKeys.longitude)
            self.likesCount = try container.decode(Int.self, forKey: SightingsAPI.SightingResponse.CodingKeys.likesCount)
            self.commentsCount = try container.decode(Int.self, forKey: SightingsAPI.SightingResponse.CodingKeys.commentsCount)
            self.flower = try container.decode(SightingsAPI.SightingResponse.Flower.self, forKey: SightingsAPI.SightingResponse.CodingKeys.flower)
            self.user = try container.decode(SightingsAPI.SightingResponse.User.self, forKey: SightingsAPI.SightingResponse.CodingKeys.user)
        }
    }
}

extension SightingsAPI.SightingResponse {
    struct Flower: Decodable {
        let id: Int
        let name: String
        let latinName: String
    }

    struct User: Decodable {
        let id: Int
        let fullName: String
    }
}
