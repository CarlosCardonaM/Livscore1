//
//  ChooseTeamTableViewViewModel.swift
//  Livscore1
//
//  Created by Carlos Cardona on 20/02/24.
//

import Foundation

class ChooseTeamTableViewViewModel {
    
    var id: Int
    var name: String
    var logo: String
    
    init(id: Int, name: String, logo: String) {
        self.id = id
        self.name = name
        self.logo = logo
    }
    
}
