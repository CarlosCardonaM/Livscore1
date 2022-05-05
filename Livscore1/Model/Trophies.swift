//
//  Trophies.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct TrophiesBody: Codable {
    var response: [TrophiesResponse]
}

struct TrophiesResponse: Codable {
    var league: String
    var country: String
    var season: String
    var place: String
}
