//
//  StandingsHeaderView.swift
//  Livscore1
//
//  Created by Carlos Cardona on 18/05/22.
//

import UIKit

class StandingsHeaderView: UIView {
    
    var playedGamesLabel: UILabel = {
        let label = UILabel()
        label.text = "J"
        label.font = .scriptFont(size: 14, style: fonts.light.description)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var goalsLabel: UILabel = {
        let label = UILabel()
        label.text = "Gol"
        label.font = .scriptFont(size: 14, style: fonts.light.description)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var goalsDiffLabel: UILabel = {
        let label = UILabel()
        label.text = "+/-"
        label.font = .scriptFont(size: 14, style: fonts.light.description)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pointsLabel: UILabel = {
        let label = UILabel()
        label.text = "Pts"
        label.font = .scriptFont(size: 14, style: fonts.light.description)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
        addSubviews()
        
        NSLayoutConstraint.activate([
            //pointsLabel
    //            pointsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            pointsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            pointsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            pointsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            pointsLabel.widthAnchor.constraint(equalToConstant: 30),
            
            //diffGoalsLabel
    //            goalsDiffLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            goalsDiffLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            goalsDiffLabel.trailingAnchor.constraint(equalTo: pointsLabel.leadingAnchor, constant: -5),
            goalsDiffLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            goalsDiffLabel.widthAnchor.constraint(equalToConstant: 40),
            
            // goalsLabel
    //            goalsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            goalsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            goalsLabel.trailingAnchor.constraint(equalTo: goalsDiffLabel.leadingAnchor, constant: -5),
            goalsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            goalsLabel.widthAnchor.constraint(equalToConstant: 40),
            
            // playedGamesLabel
    //            playedGamesLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playedGamesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            playedGamesLabel.trailingAnchor.constraint(equalTo: goalsLabel.leadingAnchor, constant: -5),
            playedGamesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            playedGamesLabel.widthAnchor.constraint(equalToConstant: 30),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        
        addSubview(pointsLabel)
        addSubview(goalsDiffLabel)
        addSubview(goalsLabel)
        addSubview(playedGamesLabel)
    }
    
}
