//
//  Sighting.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 12.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

struct Sighting: Identifiable {
    let id: Int
    let name: String
    let description: String
    let picture: URL?
    let latitude: Double
    let longitude: Double
    let likesCount: Int
    let commentsCount: Int
}
