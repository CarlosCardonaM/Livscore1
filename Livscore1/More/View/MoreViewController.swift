//
//  MoreViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 19/02/24.
//

import UIKit

class MoreViewController: UIViewController {
    
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
    
    private var moreTableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "moreCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        addSubviews()
        configureTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.heightAnchor.constraint(equalToConstant: 50),
            
            moreTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            moreTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            moreTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moreTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            appLogoImageView.centerYAnchor.constraint(equalTo: header.centerYAnchor),
            appLogoImageView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            appLogoImageView.heightAnchor.constraint(equalTo: header.heightAnchor, constant: -10)
        ])
        
    }
    
    private func configureView() {
        view.backgroundColor = UIColor(hexString: HexColors.darkBackground.description)
    }
    
    private func addSubviews() {
        view.addSubview(header)
        view.addSubview(appLogoImageView)
        view.addSubview(moreTableView)
    }
    
    private func configureTableView() {
        moreTableView.delegate = self
        moreTableView.dataSource = self
    }

}

extension MoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath) as? UITableViewCell else {
            fatalError()
        }
        cell.textLabel?.text = "Choose Team"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MoreHeaderView()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        90
    }
}

extension MoreViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
}


