//
//  FixtureTableViewViewModel.swift
//  Livscore1
//
//  Created by Carlos Cardona on 09/05/22.
//

import Foundation

class FixtureTableViewViewModel {
    var id: Int
    var date: String
    var timezone: String
    var venueId: Int
    var venueName: String
    var venueCity: String
    var statusLong: String
    var statusShort: String
    
    var leagueId: Int
    var leagueName: String
    var leagueCountry: String
    var leagueLogo: String
    var season: Int
    var round: String
    
    var homeTeamId: Int
    var homeTeamName: String
    var homeTeamLogo: String
    var homeWinner: Bool?
    
    var awayTeamId: Int
    var awayTeamName: String
    var awayTeamLogo: String
    var awayWinner: Bool
    
    var homeGoals: Int?
    var awayGoals: Int?
    
    var homeFullTimeScore: Int?
    var awayFullTimeScore: Int?
    
    init(id: Int, date: String, timezone: String, venueId: Int, venueName: String, venueCity: String, statusLong: String, statusShort: String, leagueId: Int, leagueName: String, leagueCountry: String, leagueLogo: String, season: Int, round: String, homeTeamId: Int, homeTeamName: String, homeTeamLogo: String, homeWinner: Bool?, awayTeamId: Int, awayTeamName: String, awayTeamLogo: String, awayWinner: Bool, homeGoals: Int?, awayGoals: Int?, homeFullTimeScore: Int?, awayFullTimeScore: Int?) {
        
        self.id = id
        self.date = date
        self.timezone = timezone
        self.venueId = venueId
        self.venueName = venueName
        self.venueCity = venueCity
        self.statusLong = statusLong
        self.statusShort = statusShort
        self.leagueId = leagueId
        self.leagueName = leagueName
        self.leagueCountry = leagueCountry
        self.leagueLogo = leagueLogo
        self.season = season
        self.round = round
        self.homeTeamId = homeTeamId
        self.homeTeamName = homeTeamName
        self.homeTeamLogo = homeTeamLogo
        self.homeWinner = homeWinner
        self.awayTeamId = awayTeamId
        self.awayTeamName = awayTeamName
        self.awayTeamLogo = awayTeamLogo
        self.awayWinner = awayWinner
        self.homeGoals = homeGoals
        self.awayGoals = awayGoals
        self.homeFullTimeScore = homeFullTimeScore
        self.awayFullTimeScore = awayFullTimeScore
        
    }
    
}
