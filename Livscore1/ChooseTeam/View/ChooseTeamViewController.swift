//
//  ChooseTeamViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 19/02/24.
//

import UIKit

class ChooseTeamViewController: UIViewController {
    
    private var viewModels = [ChooseTeamTableViewViewModel]()
    
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
    
    private var teamSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Type your team name"
        searchBar.overrideUserInterfaceStyle = .dark
        searchBar.showsCancelButton = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private var teamsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ChooseTeamTableViewCell.self, forCellReuseIdentifier: ChooseTeamTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureSearchBar()
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 50),
            
            appLogoImageView.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            appLogoImageView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            appLogoImageView.heightAnchor.constraint(equalTo: header.heightAnchor, constant: -10),
            
            teamSearchBar.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            teamSearchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            teamSearchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            teamSearchBar.heightAnchor.constraint(equalToConstant: 50),
            
            teamsTableView.topAnchor.constraint(equalTo: teamSearchBar.bottomAnchor, constant: 10),
            teamsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            teamsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            teamsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
    }
    
    private func addSubviews() {
        view.addSubview(header)
        view.addSubview(appLogoImageView)
        view.addSubview(teamSearchBar)
        view.addSubview(teamsTableView)
    }
    
    private func configureTableView() {
        teamsTableView.dataSource = self
        teamsTableView.delegate = self
    }
    
    private func configureSearchBar() {
        teamSearchBar.delegate = self
    }
    
    private func fetchTeams(with name: String) {
        APICaller.shared.fetchData(from: .search, parameters: [URLQueryItem(name: "search", value: name)], expecting: SearchModel.self) { [weak self] result in
            
            switch result {
            case .success(let success):
                
                let body = success.searchBody
                
                self?.viewModels = body.compactMap({
                    ChooseTeamTableViewViewModel(id: $0.team?.id ?? 44,
                                                 name: $0.team?.name ?? "Manchester city",
                                                 logo: $0.team?.logo ?? "https://media.api-sports.io/football/teams/40.png")
                })
                
                DispatchQueue.main.async {
                    self?.teamsTableView.reloadData()
                }
                
            case .failure(let failure):
                print(failure)
                DispatchQueue.main.async {
                    self?.simpleAlert(title: "Error", message: "Error trying call search endpoint")
                }
            }
            
        }
    }
}

// MARK: - TableView Datasource
extension ChooseTeamViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChooseTeamTableViewCell.identifier, for: indexPath) as? ChooseTeamTableViewCell else {
            fatalError("error creating cell in ChooseTeamViewController")
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
}

// MARK: - TableView Delegate
extension ChooseTeamViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    
}

// MARK: - Search Bar Delegate
extension ChooseTeamViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text else {
            print("text in search bar is nil")
            return
        }
        print(text)
        fetchTeams(with: text)
        print("Search button clicked")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModels.removeAll()
        DispatchQueue.main.async {
            self.teamsTableView.reloadData()
        }
    }
    
}

