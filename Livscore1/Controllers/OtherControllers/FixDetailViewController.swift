//
//  FixDetailViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 12/05/22.
//

import UIKit
import Kingfisher
import SwiftUI

class FixDetailViewController: UIViewController {
    
    
    var viewmodels = [FixtureEventCellViewModel]()
    
    var selectedFixture = Int()
    
    private var headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 200))
        view.backgroundColor = UIColor(hexString: HexColors.darkSecondaryBackgound.description)
        view.layer.cornerRadius = 10
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
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .scriptFont(size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var scoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .scriptFont(size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var homeTeamLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var homeTeamNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .left
        label.font = .scriptFont(size: 12, style: fonts.black.description)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var awayTeamLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var awayTeamNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .right
        label.font = .scriptFont(size: 12, style: fonts.black.description)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var leagueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var eventTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Events"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .scriptFont(size: 15, style: fonts.light.description)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var eventsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = UIColor(hexString: HexColors.darkSecondaryBackgound.description)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var infoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Info"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .scriptFont(size: 15, style: fonts.light.description)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var refereeView: FixtureInfoView = {
        let view = FixtureInfoView()
        view.titleLabel.text = "Referee"
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var stadiumView: FixtureInfoView = {
        let view = FixtureInfoView()
        view.titleLabel.text = "Stadium"
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addSubviews()
        fetchdata(fixtureId: selectedFixture)
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            
            // app logo
            appLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            appLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appLogoImageView.heightAnchor.constraint(equalToConstant: 35),
            
            // headerView
            headerView.topAnchor.constraint(equalTo: appLogoImageView.bottomAnchor, constant: 10),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            headerView.heightAnchor.constraint(equalToConstant: 120),
            // Score label
            scoreLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            scoreLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            // Home team logo
            homeTeamLogo.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            homeTeamLogo.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            homeTeamLogo.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            homeTeamLogo.widthAnchor.constraint(equalToConstant: 45),
            
            // Home team name
            homeTeamNameLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            homeTeamNameLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            homeTeamNameLabel.leadingAnchor.constraint(equalTo: homeTeamLogo.trailingAnchor, constant: 10),
            homeTeamNameLabel.trailingAnchor.constraint(equalTo: scoreLabel.leadingAnchor, constant: -10),
            homeTeamNameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            
            // Away team logo
            awayTeamLogo.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            awayTeamLogo.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            awayTeamLogo.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            awayTeamLogo.widthAnchor.constraint(equalToConstant: 45),
            
            //Away name label
            awayTeamNameLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            awayTeamNameLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            awayTeamNameLabel.leadingAnchor.constraint(equalTo: scoreLabel.trailingAnchor, constant: 10),
            awayTeamNameLabel.trailingAnchor.constraint(equalTo: awayTeamLogo.leadingAnchor, constant: -10),
            awayTeamNameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            // status label
            statusLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            statusLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            statusLabel.heightAnchor.constraint(equalToConstant: 18),
            
            // league image
            leagueImageView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            leagueImageView.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 10),
            leagueImageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10),
            
            // Evnets title label
            eventTitleLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            eventTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            eventTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            eventTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // events tableview
            eventsTableView.topAnchor.constraint(equalTo: eventTitleLabel.bottomAnchor, constant: 10),
            eventsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            eventsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            eventsTableView.heightAnchor.constraint(equalToConstant: 300),
            
            infoTitleLabel.topAnchor.constraint(equalTo: eventsTableView.bottomAnchor, constant: 10),
            infoTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            infoTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            infoTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            refereeView.topAnchor.constraint(equalTo: infoTitleLabel.bottomAnchor, constant: 10),
            refereeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            refereeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            refereeView.heightAnchor.constraint(equalToConstant: 60),
            
            stadiumView.topAnchor.constraint(equalTo: refereeView.bottomAnchor, constant: 10),
            stadiumView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stadiumView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stadiumView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        
    }
    
    private func configureView() {
        view.backgroundColor = UIColor(hexString: HexColors.darkBackground.description)
    }
    
    private func configureTableView() {
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
    }
    
    private func addSubviews() {
        
        view.addSubview(appLogoImageView)
        
        view.addSubview(headerView)
        
        headerView.addSubview(homeTeamLogo)
        headerView.addSubview(homeTeamNameLabel)
        headerView.addSubview(awayTeamLogo)
        headerView.addSubview(awayTeamNameLabel)
        headerView.addSubview(statusLabel)
        headerView.addSubview(scoreLabel)
        headerView.addSubview(leagueImageView)
        
        view.addSubview(eventTitleLabel)
        view.addSubview(eventsTableView)
        
        view.addSubview(infoTitleLabel)
        view.addSubview(refereeView)
        view.addSubview(stadiumView)
    }
    
    private func fetchdata(fixtureId: Int) {
        
        APICaller.shared.fetchData(from: .fixtures,
                                   parameters: [URLQueryItem(name: "id", value: String(describing: fixtureId))],
                                   expecting: FixturesBody.self) { retult in
            
            switch retult {
            case .success(let body):
                
                guard let events = body.allFixtures[0].events else { return }
                
                self.viewmodels = events.compactMap({
                    FixtureEventCellViewModel(eventTime: $0.time.elapsed,
                                              eventTeamId: $0.team.id,
                                              eventTeamName: $0.team.name,
                                              eventTeamLogo: $0.team.logo,
                                              eventPlayerId: $0.player.id,
                                              eventPlayerName: $0.player.name,
                                              eventType: $0.type,
                                              eventDetailType: $0.detail)
                })
                
                DispatchQueue.main.async {
                    self.configureComponents(with: body)
                    self.eventsTableView.reloadData()
                }
                
            case .failure(let error):
                print(error)
                self.simpleAlert(title: "error", message: "Error trying to call data on 'FixDetailViewController \(error.localizedDescription)")
            }
            
        }
        
    }
    
    private func configureComponents(with body: FixturesBody) {
        let fixture = body.allFixtures[0]
        
        if fixture.fixture.status.short != "FT" {
            statusLabel.text = "\(fixture.fixture.status.elapsed ?? 6969)'"
        } else {
            statusLabel.text = fixture.fixture.status.short
        }
        
        leagueImageView.kf.setImage(with: URL(string: fixture.league.logo))
        homeTeamLogo.kf.setImage(with: URL(string: fixture.teams.home.logo))
        awayTeamLogo.kf.setImage(with: URL(string: fixture.teams.away.logo))
        homeTeamNameLabel.text = fixture.teams.home.name
        awayTeamNameLabel.text = fixture.teams.away.name
        
        scoreLabel.text = "\(String(describing: fixture.goals.home ?? 0)) : \(String(describing: fixture.goals.away ?? 0))"
        
        refereeView.valueLabel.text = fixture.fixture.referee
        stadiumView.valueLabel.text = "\(String(describing:fixture.fixture.venue.name ?? "No stadium")), \(String(describing:fixture.fixture.venue.city ?? "No City"))"
    }
}

extension FixDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as? EventTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewmodels[indexPath.row])
        return cell
    }
    
}


extension FixDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
}
