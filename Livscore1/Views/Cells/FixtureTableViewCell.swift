//
//  FixtureTableViewCell.swift
//  Livscore1
//
//  Created by Carlos Cardona on 09/05/22.
//

import UIKit
import Kingfisher

class FixtureTableViewCell: UITableViewCell {
    
    // MARK: Comoponents
    var homeTeamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .scriptFont(size: 20, style: "light")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var homeLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "square.split.2x2.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var awayTeamLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = .scriptFont(size: 20, style: "light")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var awayLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "square.split.2x2.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(homeLogoImageView)
        contentView.addSubview(homeTeamLabel)
        contentView.addSubview(awayLogoImageView)
        contentView.addSubview(awayTeamLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(statusLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - layoutSubviews()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .black
        
        NSLayoutConstraint.activate([
            
            // homeLogoImageView
            homeLogoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            homeLogoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            homeLogoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            homeLogoImageView.widthAnchor.constraint(equalToConstant: 30),
            homeLogoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            // homeTeamLabel
            homeTeamLabel.leadingAnchor.constraint(equalTo: homeLogoImageView.trailingAnchor, constant: 10),
            homeTeamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            homeTeamLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            homeTeamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            // awayLogoImageView
            awayLogoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            awayLogoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            awayLogoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            awayLogoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            awayLogoImageView.widthAnchor.constraint(equalToConstant: 30),
            
            // awayTeamLabel
            awayTeamLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            awayTeamLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            awayTeamLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            awayTeamLabel.trailingAnchor.constraint(equalTo: awayLogoImageView.leadingAnchor, constant: -10),
            
            // timeLabel
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            timeLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.trailingAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: awayTeamLabel.leadingAnchor, constant: -10),

            // statusLabel
            statusLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            statusLabel.leadingAnchor.constraint(equalTo: homeTeamLabel.trailingAnchor, constant: 10),
            statusLabel.trailingAnchor.constraint(equalTo: awayTeamLabel.leadingAnchor, constant: -10)
            
            
        ])
    }
    
    // MARK: - Private functions
    func setupView() {
        self.backgroundColor = .black
    }
    
    // MARK: - Configure with viewModel
    func configure(with viewModel: FixtureTableViewViewModel) {
        
        guard let homeLogoURL = URL(string: viewModel.homeTeamLogo) else { return }
        guard let awayLogoURL = URL(string: viewModel.awayTeamLogo) else { return }
        
        homeTeamLabel.text = viewModel.homeTeamName
        awayTeamLabel.text = viewModel.awayTeamName
        
        timeLabel.text = viewModel.date
        
        homeLogoImageView.kf.setImage(with: homeLogoURL)
        awayLogoImageView.kf.setImage(with: awayLogoURL)
        
        if viewModel.statusShort == "FT" {
            statusLabel.text = "\(String(describing: viewModel.homeGoals!)) : \(String(describing:viewModel.awayGoals!))"
        } else {
            statusLabel.text = viewModel.statusShort
        }
    }
}
