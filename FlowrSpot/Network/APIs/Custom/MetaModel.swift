//
//  MetaModel.swift
//  FlowrSpot
//
//  Created by Alen Sebalj on 14.11.2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

struct MetaModel: Decodable {
    let pagination: Pagination
}

extension MetaModel {
    struct Pagination: Decodable {
        let currentPage: Int
        let nextPage: Int
        let totalPages: Int
    }
}
