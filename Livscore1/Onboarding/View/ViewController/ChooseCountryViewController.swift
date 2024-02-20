//
//  ChooseCountryViewController.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class ChooseCountryViewController: UIViewController {
    
    // MARK: - Variables
    private var countries: [Country] = []
    
    // MARK: - Components
    private var countriesTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: Constants.countryIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.frame = view.bounds
        configureView()
        addSubviews()
        fetchCountries()
        configureCountriesTableView()
    }
    
    // MARK: - Configure views and add subviews
    private func configureView() {
        title = "Livscore"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    private func addSubviews() {
        view.addSubview(countriesTableView)
    }
    
    private func configureCountriesTableView() {
        countriesTableView.delegate = self
        countriesTableView.dataSource = self
    }
    
    
    // MARK: - Fetch countries from API
    func fetchCountries() {
        APICaller.shared.fetchData(from: .countries, parameters: nil, expecting: CountriesBody.self) { result in
            switch result {
            case .success(let countriesBody):
                
                self.countries = countriesBody.response
                
                DispatchQueue.main.async {
                    self.countriesTableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.simpleAlert(title: "Error fetching countries", message: error.localizedDescription)
                }
                print(error)
            }
        }
    }
}

// MARK: - CountriesTableView DataSource Methods
extension ChooseCountryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.countryIdentifier, for: indexPath) as? CountryTableViewCell else {
            fatalError("Error casting CountryTableViewCell in cellForRowAt")
        }
        let country = countries[indexPath.row]
        cell.configure(with: CountriesTableViewViewModel(countryName: country.name, countryFlag: country.flag ?? "https://thumbs.dreamstime.com/z/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg"))
        return cell
    }
    
}

// MARK: - CountriesTableView Delegate Methods
extension ChooseCountryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
