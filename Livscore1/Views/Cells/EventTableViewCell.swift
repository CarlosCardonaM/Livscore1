//
//  EventTableViewCell.swift
//  Livscore1
//
//  Created by Carlos Cardona on 12/05/22.
//

import UIKit
import Kingfisher

class EventTableViewCell: UITableViewCell {
    
    static let identifier = "fixtureCell"
    
    private var minuteLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .scriptFont(size: 20, style: fonts.black.description)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var eventImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var playerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .scriptFont(size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var teamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        addSubviews()
        
        NSLayoutConstraint.activate([
            
            minuteLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            minuteLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            minuteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            minuteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            minuteLabel.widthAnchor.constraint(equalToConstant: 30),
            
            eventImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            eventImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            eventImageView.leadingAnchor.constraint(equalTo: minuteLabel.trailingAnchor, constant: 10),
            eventImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            eventImageView.widthAnchor.constraint(equalToConstant: 20),
            
            playerNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            playerNameLabel.leadingAnchor.constraint(equalTo: eventImageView.trailingAnchor, constant: 10),
            playerNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            teamLogoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            teamLogoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            teamLogoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            teamLogoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            teamLogoImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(minuteLabel)
        contentView.addSubview(eventImageView)
        contentView.addSubview(playerNameLabel)
        contentView.addSubview(teamLogoImageView)
    }
    
    private func configureView() {
        contentView.backgroundColor = UIColor(hexString: HexColors.darkSecondaryBackgound.description)
        self.accessoryType = .none
    }
    
    func configure(with viewModel: FixtureEventCellViewModel) {
        minuteLabel.text = String(describing: "\(viewModel.eventTime)'")
        playerNameLabel.text = viewModel.eventPlayerName
        teamLogoImageView.kf.setImage(with: URL(string: viewModel.eventTeamLogo))
        
        if viewModel.eventType == "subst" {
            eventImageView.image = UIImage(named: "subst")
        } else {
            eventImageView.image = UIImage(named: viewModel.eventDetailType)
        }
    }

}
