//
//  PlayerStatistics.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct PlayerStatisticsBody: Codable {
    var response: [PlayerStatisticsResponse]
}

struct PlayerStatisticsResponse: Codable {
    var player: Player
    var statistics: [PlayerStatistics]
}

struct Player: Codable {
    var id: Int
    var name: String
    var firstname: String
    var lastname: String
    var age: Int
    var birth: PlayerBirth
    var nationality: String
    var height: String
    var weight: String
    var injured: Bool
    var photo: String
}

struct PlayerBirth: Codable {
    var date: String
    var place: String
    var country: String
}

struct PlayerStatistics: Codable {
    var team: PlayerTeam
    var league: PlayerLeague
    var games: PlayerGames
    var substitutes: PlayerSubstitutes
    var shots: PlayerShots
    var goals: PlayerGoals
    var passes: PlayerPasses
    var tackles: PlayerTackles
    var duels: PlayerDuels
    var dribbles: PlayerDribbles
    var fouls: PlayerFouls
    var cards: PlayerCards
    var penalty: PlayerPenalties
}

struct PlayerTeam: Codable {
    var id: Int
    var name: String
    var logo: String
}

struct PlayerLeague: Codable {
    var id: Int?
    var name: String?
    var country: String?
    var logo: String?
    var flag: String?
//    var season: Int?
}

struct PlayerGames: Codable {
    var appearences: Int?
    var lineups: Int?
    var minutes: Int?
    var number: Int?
    var position: String?
    var rating: String?
    var captain: Bool?
}

struct PlayerSubstitutes: Codable {
    var timesIn: Int
    var timesOut: Int
    var timesInBench: Int
    
    enum CodingKeys: String, CodingKey {
        case timesIn = "in"
        case timesOut = "out"
        case timesInBench = "bench"
    }
}

struct PlayerShots: Codable {
    var total: Int?
    var on: Int?
}

struct PlayerGoals: Codable {
    var total: Int?
    var conceded: Int?
    var assists: Int?
    var saves: Int?
}

struct PlayerPasses: Codable {
    var total: Int?
    var key: Int?
    var accuracy: Int?
}

struct PlayerTackles: Codable {
    var total: Int?
    var blocks: Int?
    var interceptions: Int?
}

struct PlayerDuels: Codable {
    var total: Int?
    var won: Int?
}

struct PlayerDribbles: Codable {
    var attemps: Int?
    var success: Int?
    var past: Int?
}

struct PlayerFouls: Codable {
    var drawn: Int?
    var committed: Int?
}

struct PlayerCards: Codable {
    var yellow: Int?
    var yellowres: Int?
    var red: Int?
}

struct PlayerPenalties: Codable {
    var won: Int?
    var commited: Int?
    var scored: Int?
    var missed: Int?
}
