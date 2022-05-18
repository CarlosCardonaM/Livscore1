//
//  Constants.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

class Constants {
    
    // MARK: - URL endpoints for API Call
    static let TEAM_URL = "https://api-football-v1.p.rapidapi.com/v3/teams/statistics"
    static let LEAGUES_STATISTICS_URL = "https://api-football-v1.p.rapidapi.com/v3/leagues"
    static let SEASONS_URL = "https://api-football-v1.p.rapidapi.com/v3/leagues/seasons"
    static let COUNTRIES_URL = "https://api-football-v1.p.rapidapi.com/v3/countries"
    static let TIMEZONES_URL = "https://api-football-v1.p.rapidapi.com/v3/timezone"
    static let FIXTURES_URL = "https://api-football-v1.p.rapidapi.com/v3/fixtures"
    static let FIXTURESH2H_URL = "https://api-football-v1.p.rapidapi.com/v3/fixtures/headtohead"
    static let FIXTURES_STATISTICS_URL = "https://api-football-v1.p.rapidapi.com/v3/fixtures/statistics"
    static let TROPHIES_URL = "https://api-football-v1.p.rapidapi.com/v3/trophies"
    static let PLAYER_STATISTICS_URL = "https://api-football-v1.p.rapidapi.com/v3/players"
    static let TEAM_INFORMATION_URL = "https://api-football-v1.p.rapidapi.com/v3/teams"
    static let STANDINGS_URL = "https://api-football-v1.p.rapidapi.com/v3/standings"
    
    // MARK: - Identifiers for cells
    static let countryIdentifier = "countryId"
}

enum HexColors {
    case darkBackground
    case darkSecondaryBackgound
    case redBackground
    case darkGrey
}

extension HexColors: CustomStringConvertible {
    var description: String  {
        switch self {
        case .darkBackground:
            return "#121212"
        case .darkSecondaryBackgound:
            return "#181818"
        case .redBackground:
            return "#D70040"
        case .darkGrey:
            return "#282828"
        }
    }
}



