//
//  Team.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct TeamBody: Codable {
    var response: TeamResponse
}

struct TeamResponse: Codable {
    var biggest: Biggest
    var clean_sheet: CleanSheet
    var failed_to_score: FailedToScore
    var fixtures: Fixtures
    var form: String?
    var goals: Goals
    var league: TeamLeague
    var lineups: [Lineup]
    var penalty: Penalty
    var team: Team
}

// BIGGEST
struct Biggest: Codable {
    var goals: BiggestGoals
    var loses: Loses
    var streak: Streak
    var wins: Wins
}

struct BiggestGoals: Codable {
    var against: Against
    var biggestForGoals: BiggestForGoals
    
    enum CodingKeys: String, CodingKey {
        case against
        case biggestForGoals = "for"
    }
}

struct Against: Codable {
    var away: Int
    var home: Int
}

struct BiggestForGoals: Codable {
    var away: Int
    var home: Int
}

struct Loses: Codable {
    var away: String?
    var home: String?
}

struct Streak: Codable {
    var draws: Int
    var loses: Int
    var wins: Int
}

struct Wins: Codable {
    var away: String?
    var home: String?
}

struct CleanSheet: Codable {
    var away: Int
    var home: Int
    var total: Int
}
struct FailedToScore: Codable {
    var away: Int
    var home: Int
    var total: Int
}

struct Fixtures: Codable {
    var draws: FTDraws
    var loses: FTLoses
    var played: FTPlayed
    var wins: FTWins
}

struct FTDraws: Codable {
    var away: Int
    var home: Int
    var total: Int
}

struct FTLoses: Codable {
    var away: Int
    var home: Int
    var total: Int
}

struct FTPlayed: Codable {
    var away: Int
    var home: Int
    var total: Int
}

struct FTWins: Codable {
    var away: Int
    var home: Int
    var total: Int
}

struct Goals: Codable {
    var against: GoalsAgainst
    var goalsFor: GoalsFor
    
    
    enum CodingKeys: String, CodingKey {
        case against
        case goalsFor = "for"
    }
}

struct GoalsAgainst: Codable {
    var average: AgainstAverage
    var total: AgainstTotal
}

struct AgainstAverage: Codable {
    var away: String
    var home: String
    var total: String
}

struct AgainstTotal: Codable {
    var away: Int
    var home: Int
    var total: Int
}

struct GoalsFor: Codable {
    var average: ForAverage
    var total: ForTotal
}

struct ForAverage: Codable {
    var away: String
    var home: String
    var total: String
}

struct ForTotal: Codable {
    var away: Int
    var home: Int
    var total: Int
}

struct TeamLeague: Codable {
    var country: String
    var flag: String
    var id: Int
    var logo: String
    var name: String
    var season: Int
}

struct Lineup: Codable {
    var formation: String
    var played: Int
}

struct Penalty: Codable {
    var missed: Missed
    var scored: Scored
    var total: Int
}

struct Missed: Codable {
    var percentage: String
    var total: Int
}

struct Scored: Codable {
    var percentage: String
    var total: Int
}

struct Team: Codable {
    var id: Int
    var logo: String
    var name: String
}
