//
//  FixturesViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class FixturesViewController: UIViewController {
    
    private var dateToStringFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.dateStyle = .short
        return formatter
    }()
    
    private var stringToDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFixtures()
    }
    
    private func fetchFixtures() {
        APICaller.shared.fetchData(from: .fixtures, parameters: [URLQueryItem(name: "season", value: "2021"),
                                                                 URLQueryItem(name: "team", value: "40")
                                                                ], expecting: FixturesBody.self) { result in
            switch result {
            case .success(let body):
                let fixtures = body.allFixtures
                
                for fixture in fixtures {
                    
                    print(self.setFormatter(dateString: fixture.fixture.date))
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
    
    private func setFormatter(dateString: String) -> String {
        // TODO: - Improve date formatter
        guard let date = stringToDateFormatter.date(from: dateString) else {
            return "Unknown date"
        }
        return dateToStringFormatter.string(from: date)
    }
    
}
