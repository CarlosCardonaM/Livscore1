//
//  StandingsTableViewViewModel.swift
//  Livscore1
//
//  Created by Carlos Cardona on 17/05/22.
//

import Foundation

class StandingsTableViewViewModel {
    var leagueId: Int
    var leagueName: String
    var leagueLogo: String
    var leagueSeason: Int
    
    var rank: Int
    
    var teamId: Int
    var teamName: String
    var teamLogo: String
    
    var points: Int
    var goalsDiff: Int
    var group: String
    var form: String
    var status: String
    var description: String?
    var allPlayed: Int
    var allWin: Int
    var allDraw: Int
    var allLose: Int
    var allGoalsFor: Int
    var allGoalsAway: Int
    var homePlayed: Int
    var homeWin: Int
    var homeDraw: Int
    var homeLose: Int
    var homeGoalsFor: Int
    var homeGoalsAgainst: Int
    var awayPlayed: Int
    var awayWin: Int
    var awayDraw: Int
    var awayLose: Int
    var awayGoalsFor: Int
    var awayGoalsAgainst: Int
    var update: String
    
    
    init(leagueId: Int,
         leagueName: String,
         leagueLogo: String,
         leagueSeason: Int,
         rank: Int,
         teamName: String,
         teamId: Int,
         teamLogo: String,
         points: Int,
         goalsDiff: Int,
         group: String,
         form: String,
         status: String,
         description: String?,
         allPlayed: Int,
         allWin: Int,
         allDraw: Int,
         allLose: Int,
         allGoalsFor: Int,
         allGoalsAway: Int,
         homePlayed: Int,
         homeWin: Int,
         homeDraw: Int,
         homeLose: Int,
         homeGoalsFor: Int,
         homeGoalsAgainst: Int,
         awayPlayed: Int,
         awayWin: Int,
         awayDraw: Int,
         awayLose: Int,
         awayGoalsFor: Int,
         awayGoalsAgainst: Int,
         update: String
    ) {
        
        self.leagueId = leagueId
        self.leagueName = leagueName
        self.leagueLogo = leagueLogo
        self.leagueSeason = leagueSeason
        self.rank = rank
        self.teamId = teamId
        self.teamName = teamName
        self.teamLogo = teamLogo
        self.goalsDiff = goalsDiff
        self.points = points
        self.group = group
        self.form = form
        self.status = status
        self.description = description
        self.allPlayed = allPlayed
        self.allWin = allWin
        self.allDraw = allDraw
        self.allLose = allLose
        self.allGoalsFor = allGoalsFor
        self.allGoalsAway = allGoalsAway
        self.homePlayed = homePlayed
        self.homeWin = homeWin
        self.homeDraw = homeWin
        self.homeLose = homeLose
        self.homeGoalsFor = homeGoalsFor
        self.homeGoalsAgainst = homeGoalsAgainst
        self.awayPlayed = awayPlayed
        self.awayWin = awayWin
        self.awayDraw = awayDraw
        self.awayLose = awayLose
        self.awayGoalsFor = awayGoalsFor
        self.awayGoalsAgainst = awayGoalsAgainst
        self.update = update
    }
}
