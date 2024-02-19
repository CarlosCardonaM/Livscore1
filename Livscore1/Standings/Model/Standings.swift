//
//  Standings.swift
//  Livscore1
//
//  Created by Carlos Cardona on 17/05/22.
//

import Foundation

struct StandingsBody: Codable {
    var response: [StandingResponse]
}

struct StandingResponse: Codable {
    var league: StandingLeague
}

struct StandingLeague: Codable {
    var id: Int
    var name: String
    var country: String
    var logo: String
    var flag: String
    var season: Int
    var standings: [[Standings]]
}

struct Standings: Codable {
    var rank: Int
    var team: StandingTeam
    var points: Int
    var goalsDiff: Int
    var group: String
    var form: String
    var status: String
    var description: String?
    var all: All
    var home: Home
    var away: Away
    var update: String
}

struct Away: Codable {
    var played: Int
    var win: Int
    var draw: Int
    var lose: Int
    var goals: AwayGoals
}

struct AwayGoals: Codable {
    var goalsFor: Int
    var goalsAgainst: Int
    
    enum CodingKeys: String, CodingKey {
        case goalsFor = "for"
        case goalsAgainst = "against"
    }
}

struct Home: Codable {
    var played: Int
    var win: Int
    var draw: Int
    var lose: Int
    var goals: HomeGoals
}

struct HomeGoals: Codable {
    var goalsFor: Int
    var goalsAgainst: Int
    
    enum CodingKeys: String, CodingKey {
        case goalsFor = "for"
        case goalsAgainst = "against"
    }
}

struct All: Codable {
    var played: Int
    var win: Int
    var draw: Int
    var lose: Int
    var goals: AllGoals
}

struct AllGoals: Codable {
    var goalsFor: Int
    var goalsAgainst: Int
    
    enum CodingKeys: String, CodingKey {
        case goalsFor = "for"
        case goalsAgainst = "against"
    }
}

struct StandingTeam: Codable {
    var id: Int
    var name: String
    var logo: String
}
