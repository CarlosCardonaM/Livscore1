//
//  Timezones.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct Timezone: Codable {
    var timezones: [String]
    
    enum CodingKeys: String, CodingKey {
        case timezones = "response"
    }
}
