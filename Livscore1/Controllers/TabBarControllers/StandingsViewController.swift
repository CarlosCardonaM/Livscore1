//
//  StandingsViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 17/05/22.
//

import UIKit

class StandingsViewController: UIViewController {
    
    var viewmodels = [StandingsTableViewViewModel]()
    
    private var header: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var appLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "applogo3")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var standingsTableview: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.register(StandingTableViewCell.self, forCellReuseIdentifier: StandingTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        fetchStandings()
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 50),
            
            standingsTableview.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            standingsTableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            standingsTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            standingsTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            appLogoImageView.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            appLogoImageView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            appLogoImageView.heightAnchor.constraint(equalTo: header.heightAnchor, constant: -10)
        ])
    }
    
    private func configureView() {
        view.backgroundColor = UIColor(hexString: HexColors.darkBackground.description)
    }
    
    private func addSubviews() {
        view.addSubview(standingsTableview)
        view.addSubview(header)
        view.addSubview(appLogoImageView)
    }
    
    private func configureTableView() {
        standingsTableview.dataSource = self
        standingsTableview.delegate = self
    }
    
    private func fetchStandings() {
        APICaller.shared.fetchData(from: .standings,
                                   parameters: [URLQueryItem(name: "season", value: "2022"),
                                                URLQueryItem(name: "league", value: "39")],
                                   expecting: StandingsBody.self) { result in
            
            switch result {
            case .success(let body):
                let response = body.response
                
                self.viewmodels = response[0].league.standings[0].compactMap({
                
                    StandingsTableViewViewModel(leagueId: response[0].league.id,
                                                leagueName: response[0].league.name,
                                                leagueLogo: response[0].league.logo,
                                                leagueSeason: response[0].league.season,
                                                rank: $0.rank,
                                                teamName: $0.team.name,
                                                teamId: $0.team.id,
                                                teamLogo: $0.team.logo,
                                                points: $0.points,
                                                goalsDiff: $0.goalsDiff,
                                                group: $0.group,
                                                form: $0.form,
                                                status: $0.status,
                                                description: $0.description,
                                                allPlayed: $0.all.played,
                                                allWin: $0.all.win,
                                                allDraw: $0.all.draw,
                                                allLose: $0.all.lose,
                                                allGoalsFor: $0.all.goals.goalsFor,
                                                allGoalsAway: $0.all.goals.goalsAgainst,
                                                homePlayed: $0.home.played,
                                                homeWin: $0.home.win,
                                                homeDraw: $0.home.draw,
                                                homeLose: $0.home.lose,
                                                homeGoalsFor: $0.home.goals.goalsFor,
                                                homeGoalsAgainst: $0.home.goals.goalsAgainst,
                                                awayPlayed: $0.away.played,
                                                awayWin: $0.away.win,
                                                awayDraw: $0.away.draw,
                                                awayLose: $0.away.lose,
                                                awayGoalsFor: $0.away.goals.goalsFor,
                                                awayGoalsAgainst: $0.away.goals.goalsAgainst,
                                                update: $0.update)
                    
                })
                
                DispatchQueue.main.async {
                    self.standingsTableview.reloadData()
                }
                
            case .failure(let error):
                print(error)
                // TODO: Handle errors
            }
        }
    }
}

extension StandingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StandingTableViewCell.identifier, for: indexPath) as? StandingTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewmodels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = StandingsHeaderView()
        return headerView
    }
}

extension StandingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
}
