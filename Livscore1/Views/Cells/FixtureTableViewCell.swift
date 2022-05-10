//
//  FixtureTableViewCell.swift
//  Livscore1
//
//  Created by Carlos Cardona on 09/05/22.
//

import UIKit

class FixtureTableViewCell: UITableViewCell {
    
    // MARK: Comoponents
    var homeTeamLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.baselineAdjustment = .alignCenters
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
        label.textAlignment = .right
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
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
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
        
        NSLayoutConstraint.activate([
            
            // homeLogoImageView
            homeLogoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            homeLogoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            homeLogoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            homeLogoImageView.widthAnchor.constraint(equalToConstant: 20),
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
            awayLogoImageView.widthAnchor.constraint(equalToConstant: 20),
            
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
    
    // MARK: - Configure with viewModel
    func configure(with viewModel: FixtureTableViewViewModel) {
        homeTeamLabel.text = viewModel.homeTeamName
        awayTeamLabel.text = viewModel.awayTeamName
        statusLabel.text = viewModel.statusShort
        timeLabel.text = viewModel.date
    }
}
