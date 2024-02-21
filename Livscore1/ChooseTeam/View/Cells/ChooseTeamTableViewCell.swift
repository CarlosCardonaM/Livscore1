//
//  ChooseTeamTableViewCell.swift
//  Livscore1
//
//  Created by Carlos Cardona on 20/02/24.
//

import UIKit
import Kingfisher

class ChooseTeamTableViewCell: UITableViewCell {
    
    static let identifier: String = "chooseTeamCell"
    
    var backgorundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hexString: HexColors.darkSecondaryBackgound.description)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
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
            
            teamLogoImageView.topAnchor.constraint(equalTo: backgorundView.topAnchor, constant: 5),
            teamLogoImageView.leadingAnchor.constraint(equalTo: backgorundView.leadingAnchor, constant: 5),
            teamLogoImageView.bottomAnchor.constraint(equalTo: backgorundView.bottomAnchor, constant: -5),
            teamLogoImageView.widthAnchor.constraint(equalToConstant: 50),
            
            //nameLabel
            //teamNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamNameLabel.topAnchor.constraint(equalTo: teamLogoImageView.topAnchor, constant: 5),
            teamNameLabel.leadingAnchor.constraint(equalTo: teamLogoImageView.trailingAnchor, constant: 5),
            teamNameLabel.bottomAnchor.constraint(equalTo: teamLogoImageView.bottomAnchor, constant: -5),
            teamNameLabel.trailingAnchor.constraint(equalTo: backgorundView.trailingAnchor, constant: -5)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented - ChooseTeamViewController")
    }
    
    private func addSubviews() {
        contentView.addSubview(backgorundView)
        backgorundView.addSubview(teamLogoImageView)
        backgorundView.addSubview(teamNameLabel)
    }
    
    public func configure(with viewModel: ChooseTeamTableViewViewModel) {
        teamLogoImageView.kf.setImage(with: URL(string: viewModel.logo))
        teamNameLabel.text = viewModel.name
    }
}
