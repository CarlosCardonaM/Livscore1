//
//  StatsTableViewViewModel.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import Foundation

struct StatsTableviewViewModel {
    var cellTitle: String?
    var homeValue: String?
    var awayValue: String?
    var totalValue: String?
    
    init(cellTitle: String?, homeValue: String?, awayValue: String?, totalValue: String?) {
        self.cellTitle = cellTitle
        self.homeValue = homeValue
        self.awayValue = awayValue
        self.totalValue = totalValue
    }
}
