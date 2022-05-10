//
//  FixturesViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class FixturesViewController: UIViewController {
    
    // MARK: - Variables
    
    var viewModels = [FixtureTableViewViewModel]()
    
    
    // MARK: - Components
    private var header: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: "#D70040")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var appLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "applogo2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var fixturesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FixtureTableViewCell.self, forCellReuseIdentifier: "fixtCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addSubview()
        fetchFixtures()
        configureFixtureTableView()
    }
    
    // MARK: - viewDidLayoutSubviews()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 50),
            
            fixturesTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            fixturesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            fixturesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fixturesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            appLogoImageView.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            appLogoImageView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            appLogoImageView.heightAnchor.constraint(equalTo: header.heightAnchor, constant: -10)
            
        ])
    }
    
    private func configureView() {
        view.backgroundColor = UIColor(hexString: "#D70040")
    }
    
    // MARK: - configure fixtureTableView
    private func configureFixtureTableView() {
        fixturesTableView.dataSource = self
        fixturesTableView.delegate = self
    }
    
    // MARK: - AddSubviews()
    private func addSubview() {
        view.addSubview(header)
        view.addSubview(fixturesTableView)
        view.addSubview(appLogoImageView)
    }
    
    // MARK: - fecth fixtures
    private func fetchFixtures() {
        APICaller.shared.fetchData(from: .fixtures, parameters: [URLQueryItem(name: "season", value: "2021"),
                                                                 URLQueryItem(name: "team", value: "40")
                                                                ], expecting: FixturesBody.self) { result in
            switch result {
            case .success(let body):
                let fixtures = body.allFixtures
                
                self.viewModels = fixtures.compactMap({
                    FixtureTableViewViewModel(id: $0.fixture.id,
                                              date: self.setFormatter(dateString: $0.fixture.date),
                                              timezone: $0.fixture.timezone,
                                              venueId: $0.fixture.venue.id ?? 0000,
                                              venueName: $0.fixture.venue.name ?? "No name",
                                              venueCity: $0.fixture.venue.city ?? "No city",
                                              statusLong: $0.fixture.status.long,
                                              statusShort: $0.fixture.status.short,
                                              leagueId: $0.league.id,
                                              leagueName: $0.league.name,
                                              leagueCountry: $0.league.country,
                                              leagueLogo: $0.league.logo,
                                              season: $0.league.season,
                                              round: $0.league.round,
                                              homeTeamId: $0.teams.home.id,
                                              homeTeamName: $0.teams.home.name,
                                              homeTeamLogo: $0.teams.home.logo,
                                              homeWinner: $0.teams.home.winner,
                                              awayTeamId: $0.teams.away.id,
                                              awayTeamName: $0.teams.away.name,
                                              awayTeamLogo: $0.teams.away.logo,
                                              awayWinner: $0.teams.away.winner ?? false,
                                              homeGoals: $0.goals.home,
                                              awayGoals: $0.goals.away,
                                              homeFullTimeScore: $0.score.fulltime.home,
                                              awayFullTimeScore: $0.score.fulltime.home)
                })
                
                DispatchQueue.main.async {
                    self.fixturesTableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
                self.simpleAlert(title: "Error", message: "Error trying to fetch fixture data")
            }
        }
    }
    
    // MARK: - Configure formatters
    private func setFormatter(dateString: String) -> String {
        // TODO: - Improve date formatter
        guard let date = stringToDateFormatter.date(from: dateString) else {
            return "Unknown date"
        }
        return dateToStringFormatter.string(from: date)
    }
    
}

// MARK: - fixtureTableView Datasource methods
extension FixturesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "fixtCell", for: indexPath) as? FixtureTableViewCell else {
            fatalError("error casting table view cell")
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
        
    }
    
}

// MARK: - fixtureTableView Delegte methods
extension FixturesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}