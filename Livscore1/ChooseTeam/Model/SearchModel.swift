//
//  SearchModel.swift
//  Livscore1
//
//  Created by Carlos Cardona on 19/02/24.
//

import Foundation

struct SearchModel: Codable {
    let searchBody: [SearchResponse]
    
    enum CodingKeys: String, CodingKey {
        case searchBody = "response"
    }
}

struct SearchResponse: Codable {
    let team: Team?
    let venue: TeamVenue?
}

