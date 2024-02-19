//
//  CountriesTableView.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

class CountriesTableViewViewModel {

    var countryName: String
    var countrFlag: String
    
    init(countryName: String, countryFlag: String) {
        self.countryName = countryName
        self.countrFlag = countryFlag
    }
}
