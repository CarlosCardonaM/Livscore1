//
//  FixtureEventCellViewModel.swift
//  Livscore1
//
//  Created by Carlos Cardona on 13/05/22.
//

import Foundation

class FixtureEventCellViewModel {
    
    var eventTime: Int
    var eventTeamId: Int
    var eventTeamName: String
    var eventTeamLogo: String
    var eventPlayerId: Int
    var eventPlayerName: String
    var eventType: String
    var eventDetailType: String
    
    init(eventTime: Int, eventTeamId: Int, eventTeamName: String, eventTeamLogo: String, eventPlayerId: Int, eventPlayerName: String, eventType: String, eventDetailType: String) {
        self.eventTime = eventTime
        self.eventTeamId = eventTeamId
        self.eventTeamName = eventTeamName
        self.eventTeamLogo = eventTeamLogo
        self.eventPlayerId = eventPlayerId
        self.eventPlayerName = eventPlayerName
        self.eventType = eventType
        self.eventDetailType = eventDetailType
    }
}
