//
//  League.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct LeagueBody: Codable {
    var response: [LeagueResponse]
}

struct LeagueResponse: Codable {
    var league: League
    var country: LeagueCountry
    var seasons: [Season]
}

struct League: Codable {
    var id: Int
    var name: String
    var type: String
    var logo: String
}

struct LeagueCountry: Codable {
    var name: String
    var code: String
    var flag: String
}

struct Season: Codable {
    var year: Int
    var start: String
    var end: String
    var current: Bool
    
    var coverage: Coverage
}

struct Coverage: Codable {
    var fixtures: FixtureCoverage
    var standings: Bool
    var players: Bool
    var top_scorers: Bool
}

struct FixtureCoverage: Codable {
    var events: Bool
    var lineups: Bool
}
