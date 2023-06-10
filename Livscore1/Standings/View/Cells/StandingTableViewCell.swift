//
//  StandingTableViewCell.swift
//  Livscore1
//
//  Created by Carlos Cardona on 17/05/22.
//

import UIKit
import Kingfisher

class StandingTableViewCell: UITableViewCell {
    
    static let identifier = "standingCell"
    
    var backgorundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: HexColors.darkSecondaryBackgound.description)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var rankLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var playedGamesLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var goalsLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var goalsDiffLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pointsLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(hexString: HexColors.darkBackground.description)
        
        addSubviews()
        
        NSLayoutConstraint.activate([
            
            //backgroundView
            backgorundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3),
            backgorundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            backgorundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            backgorundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            // rankLabel
//            rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rankLabel.topAnchor.constraint(equalTo: backgorundView.topAnchor, constant: 5),
            rankLabel.leadingAnchor.constraint(equalTo: backgorundView.leadingAnchor, constant: 5),
            rankLabel.bottomAnchor.constraint(equalTo: backgorundView.bottomAnchor, constant: -5),
//            rankLabel.widthAnchor.constraint(equalToConstant: 20),
            
            //logoImageView
//            teamLogoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamLogoImageView.topAnchor.constraint(equalTo: backgorundView.topAnchor, constant: 5),
            teamLogoImageView.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 5),
            teamLogoImageView.bottomAnchor.constraint(equalTo: backgorundView.bottomAnchor, constant: -5),
            teamLogoImageView.widthAnchor.constraint(equalToConstant: 20),
            
            //nameLabel
//            teamNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamNameLabel.topAnchor.constraint(equalTo: backgorundView.topAnchor, constant: 5),
            teamNameLabel.leadingAnchor.constraint(equalTo: teamLogoImageView.trailingAnchor, constant: 5),
            teamNameLabel.bottomAnchor.constraint(equalTo: backgorundView.bottomAnchor, constant: -5),
            
            //pointsLabel
//            pointsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pointsLabel.topAnchor.constraint(equalTo: backgorundView.topAnchor, constant: 5),
            pointsLabel.trailingAnchor.constraint(equalTo: backgorundView.trailingAnchor, constant: -5),
            pointsLabel.bottomAnchor.constraint(equalTo: backgorundView.bottomAnchor, constant: -5),
            pointsLabel.widthAnchor.constraint(equalToConstant: 30),
            
            //diffGoalsLabel
//            goalsDiffLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            goalsDiffLabel.topAnchor.constraint(equalTo: backgorundView.topAnchor, constant: 5),
            goalsDiffLabel.trailingAnchor.constraint(equalTo: pointsLabel.leadingAnchor, constant: -5),
            goalsDiffLabel.bottomAnchor.constraint(equalTo: backgorundView.bottomAnchor, constant: -5),
            goalsDiffLabel.widthAnchor.constraint(equalToConstant: 40),
            
            // goalsLabel
//            goalsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            goalsLabel.topAnchor.constraint(equalTo: backgorundView.topAnchor, constant: 5),
            goalsLabel.trailingAnchor.constraint(equalTo: goalsDiffLabel.leadingAnchor, constant: -5),
            goalsLabel.bottomAnchor.constraint(equalTo: backgorundView.bottomAnchor, constant: -5),
            goalsLabel.widthAnchor.constraint(equalToConstant: 40),
            
            // playedGamesLabel
//            playedGamesLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playedGamesLabel.topAnchor.constraint(equalTo: backgorundView.topAnchor, constant: 5),
            playedGamesLabel.trailingAnchor.constraint(equalTo: goalsLabel.leadingAnchor, constant: -5),
            playedGamesLabel.bottomAnchor.constraint(equalTo: backgorundView.bottomAnchor, constant: -5),
            playedGamesLabel.widthAnchor.constraint(equalToConstant: 30),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(backgorundView)
        backgorundView.addSubview(rankLabel)
        backgorundView.addSubview(teamLogoImageView)
        backgorundView.addSubview(teamNameLabel)
        backgorundView.addSubview(pointsLabel)
        backgorundView.addSubview(goalsDiffLabel)
        backgorundView.addSubview(goalsLabel)
        backgorundView.addSubview(playedGamesLabel)
        
    }
    
    public func configure(with viewmodel: StandingsTableViewViewModel) {
        
        teamLogoImageView.kf.setImage(with: URL(string: viewmodel.teamLogo))
        
        rankLabel.text = String(viewmodel.rank)
        teamNameLabel.text = viewmodel.teamName
        playedGamesLabel.text = String(viewmodel.allPlayed)
        goalsLabel.text = "\(viewmodel.allGoalsFor):\(viewmodel.allGoalsAway)"
        goalsDiffLabel.text = String(viewmodel.goalsDiff)
        pointsLabel.text = String(viewmodel.points)
    }
    
}
