//
//  Countries.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct CountriesBody: Codable {
    var response: [Country]
}

struct Country: Codable {
    var code: String?
    var flag: String?
    var name: String
}

