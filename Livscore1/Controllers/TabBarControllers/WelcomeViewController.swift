//
//  WelcomeViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Variables
    var viewmodels = [StatsTableviewViewModel]()
    var data: TeamBody?
    
    // MARK: - Components
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh", attributes: attributes)
        refreshControl.tintColor = .white
        return refreshControl
    }()
    
    var appLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "applogo2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 25
        return view
    }()
    
    var statsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.alwaysBounceVertical = false
        tableView.allowsSelection = false
        tableView.register(StatsTableViewCell.self, forCellReuseIdentifier: StatsTableViewCell.identifier)
        return tableView
    }()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "logo")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var statsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.scriptFont(size: 28)
        label.text = "Top Stats"
        return label
    }()
    
    var goalsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.scriptFont(size: 20)
        label.text = "Goals on Season 21/22"
        return label
    }()
    
    var formLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.scriptFont(size: 20, style: fonts.light.description)
        return label
    }()

    // MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addSubviews()
        configureStatsTableView()
//        fetchData()
        
    }
    
    // MARK: - ViewDidLayoutSubviews()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoImageView.frame = CGRect(x: view.width - 140, y: -70, width: 280, height: 280)
        appLogoImageView.frame = CGRect(x: 30, y: 60, width: 200, height: 100)
        middleView.frame = CGRect(x: 0, y: view.height / 6, width: view.width, height: view.height + 100)
        scrollView.frame = view.bounds
        
        scrollView.contentSize = CGSize(width: view.width, height: view.height + 200)
        
        statsTitleLabel.frame = CGRect(x: 20, y: 20, width: middleView.width - 120, height: 42)
        formLabel.frame = CGRect(x: statsTitleLabel.right + 5, y: 20, width: middleView.width - 105, height: 42)
        statsTableView.frame = CGRect(x: middleView.left + 10, y: statsTitleLabel.bottom + 20, width: middleView.width - 20, height: middleView.height - 92)
    }
    
    // MARK: - Fetch Data
    private func fetchData() {
        
        viewmodels.removeAll()
        
        APICaller.shared.fetchData(from: .teamStatistics,
                                   parameters: [
                                   URLQueryItem(name: "league", value: "39"),
                                   URLQueryItem(name: "season", value: "2021"),
                                   URLQueryItem(name: "team", value: "40")
                                   ],
                                   expecting: TeamBody.self) { result in
            switch result {
            case .success(let body):
                
                self.data = body
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.refreshControl.endRefreshing()
                    self.setUpViewmodels()
                    self.formLabel.text = String(describing: body.response.form?.suffix(5) ?? "")
                    self.statsTableView.reloadData()
                }
            case .failure(let error):
                self.simpleAlert(title: "Error", message: error.localizedDescription)
                print(error)
            }
        }
    }
    
    // MARK: - Setup Viewmodels
    private func setUpViewmodels() {
        
        guard let data = data else {
            return
        }

        self.viewmodels = [
            StatsTableviewViewModel(cellTitle: "Goals", homeValue: String(describing: data.response.goals.goalsFor.total.home), awayValue: String(describing: data.response.goals.goalsFor.total.away), totalValue: String(describing: data.response.goals.goalsFor.total.total)),
            StatsTableviewViewModel(cellTitle: "Clean Sheets", homeValue: String(describing: data.response.clean_sheet.home), awayValue: String(describing: data.response.clean_sheet.away), totalValue: String(describing: data.response.clean_sheet.total))
        ]
    }
    
    // MARK: - ConfigureView
    func configureView() {
        title = "Livscore"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor(hexString: HexColors.redBackground.description)
    }
    
    // MARK: - AddSubviews()
    func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(appLogoImageView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(middleView)
        
        middleView.addSubview(statsTableView)
        middleView.addSubview(statsTitleLabel)
        middleView.addSubview(formLabel)
        middleView.addSubview(statsTableView)
        
        middleView.addSubview(refreshControl)
    }
    
    // MARK: - Configure statsTableView
    private func configureStatsTableView() {
        statsTableView.dataSource = self
        statsTableView.delegate = self
        
        refreshControl.addTarget(self, action: #selector(didRefresh(_:)), for: .valueChanged)
    }
    
    // MARK: - OBJC Methods
    @objc private func didRefresh(_ sender: AnyObject) {
        fetchData()
    }

}

// MARK: - StatsTableView Datasource Methods
extension WelcomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatsTableViewCell.identifier, for: indexPath) as? StatsTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewmodels[indexPath.row])
        return cell
    }
}

// MARK: - StatsTableView Delegate Methods
extension WelcomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
