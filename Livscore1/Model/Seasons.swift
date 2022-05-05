//
//  Seasons.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct SeasonsBody: Codable {
    var seasons: [Int]
    
    enum CodingKeys: String, CodingKey {
        case seasons = "response"
    }
}
