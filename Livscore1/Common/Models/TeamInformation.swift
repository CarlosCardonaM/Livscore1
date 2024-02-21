//
//  TeamInformation.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct TeamInformationBody: Codable {
    var response: [TeamInformationResponse]
}

struct TeamInformationResponse: Codable {
    var team: TeamInformation
    var venue: TeamVenue
}

struct TeamInformation: Codable {
    var id: Int
    var name: String
    var code: String
    var country: String
    var founded: Int
    var national: Bool
    var logo: String
}

struct TeamVenue: Codable {
    var id: Int?
    var name: String?
    var address: String?
    var city: String?
    var capacity: Int?
    var surface: String?
    var image: String?
}
