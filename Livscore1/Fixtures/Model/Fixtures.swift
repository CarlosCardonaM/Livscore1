//
//  Fixtures.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct FixturesBody: Codable {
    var allFixtures: [FixtureResponse]
    
    enum CodingKeys: String, CodingKey {
        case allFixtures = "response"
    }
}

struct FixtureResponse: Codable {
    var fixture: Fixture
    var league: FixtureLeague
    var teams: FixtureTeams
    var goals: FixtureGoals
    var score: FixtureScore
    var events: [FixtureEvents]?
}

struct Fixture: Codable {
    var id: Int
    var referee: String?
    var timezone: String
    var date: String
    var timestamp: Int
    var periods: Periods
    var venue: Venue
    var status: Status
}

struct Periods: Codable {
    var first: Int?
    var second: Int?
}

struct Venue: Codable {
    var id: Int?
    var name: String?
    var city: String?
}

struct Status: Codable {
    var long: String
    var short: String
    var elapsed: Int?
}

struct FixtureLeague: Codable {
    var id: Int
    var name: String
    var country: String
    var logo: String
    var flag: String?
    var season: Int
    var round: String
}

struct FixtureTeams: Codable {
    var home: HomeTeam
    var away: AwayTeam
}

struct HomeTeam: Codable {
    var id: Int
    var name: String
    var logo: String
    var winner: Bool?
}

struct AwayTeam: Codable {
    var id: Int
    var name: String
    var logo: String
    var winner: Bool?
}

struct FixtureGoals: Codable {
    var home: Int?
    var away: Int?
}

struct FixtureScore: Codable {
    var halftime: HalftimeScore
    var fulltime: FulltimeScore
    var extratime: ExtratimeScore
    var penalty: PenaltyScore
}

struct HalftimeScore: Codable {
    var home: Int?
    var away: Int?
}
struct FulltimeScore: Codable {
    var home: Int?
    var away: Int?
}

struct ExtratimeScore: Codable {
    var home: Int?
    var away: Int?
}

struct PenaltyScore: Codable {
    var home: Int?
    var away: Int?
}

struct FixtureEvents: Codable {
    var time: EventTime
    var team: EvnetTeam
    var player: EventPlayer
    var assist: EventAssist
    var type: String
    var detail: String
    var comments: String?
}

struct EventTime: Codable {
    var elapsed: Int
}

struct EvnetTeam: Codable {
    var id: Int
    var name: String
    var logo: String
}

struct EventPlayer: Codable {
    var id: Int
    var name: String
}

struct EventAssist: Codable {
    var id: Int?
    var name: String?
}
