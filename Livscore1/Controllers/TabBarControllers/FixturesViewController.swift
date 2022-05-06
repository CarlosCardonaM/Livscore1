//
//  FixturesViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class FixturesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchFixtures()
    }
    
    private func fetchFixtures() {
        APICaller.shared.fetchData(from: .fixtures, parameters: [URLQueryItem(name: "season", value: "2021"),
                                                                 URLQueryItem(name: "team", value: "40")
                                                                ], expecting: FixturesBody.self) { result in
            switch result {
            case .success(let body):
                let fixtures = body.allFixtures
                
                for fixture in fixtures {
                    
                    print("Date: \(fixture.fixture.date)")
                    print(fixture.teams.home.name)
                    print("VS")
                    print(fixture.teams.away.name)
                    if let winner = fixture.teams.home.winner {
                        if winner {
                            print("Winner: \(fixture.teams.home.name)")
                        } else {
                            print("Winner: \(fixture.teams.away.name)")
                        }
                    }
                    print("--------------------")
                    print(" ")
                }
                
            case .failure(let error):
                print(error)
                self.simpleAlert(title: "Error", message: "Error trying to fetch fixture data")
            }
        }
    }
    
}
