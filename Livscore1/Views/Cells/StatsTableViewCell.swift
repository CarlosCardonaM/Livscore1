//
//  StatsTableViewCell.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class StatsTableViewCell: UITableViewCell {
    
    static let identifier = "StatsID"
    
    private var cellTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 30)
        label.textColor = .white
        return label
    }()
    
    private var homeView: CardView = {
        let card = CardView()
        card.cardTitle.text = "Home"
        return card
    }()
    private var awayView: CardView = {
        let card = CardView()
        card.cardTitle.text = "Away"
        return card
    }()
    
    private var totalView: CardView = {
        let card = CardView()
        card.cardTitle.text = "Total"
        return card
    }()
    
    private var homeTitle: UILabel = {
        let label = UILabel()
        label.text = "Home"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        addSubview()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cellTitleLabel.frame = CGRect(x: 10, y: 10, width: contentView.width - 20, height: 40)
        homeView.frame = CGRect(x: 10, y: cellTitleLabel.bottom + 10, width: (contentView.width - 40) / 3, height: contentView.height - 70)
        awayView.frame = CGRect(x: homeView.right + 10, y: cellTitleLabel.bottom + 10, width: (contentView.width - 40) / 3, height: contentView.height - 70)
        totalView.frame = CGRect(x: awayView.right + 10, y: cellTitleLabel.bottom + 10, width: (contentView.width - 40) / 3, height: contentView.height - 70)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        contentView.addSubview(cellTitleLabel)
        contentView.addSubview(homeView)
        contentView.addSubview(awayView)
        contentView.addSubview(totalView)
//        homeView.addSubview(homeTitle)
    }
    
    func configure(with viewModel: StatsTableviewViewModel) {
        cellTitleLabel.text = viewModel.cellTitle
        homeView.cardValue.text = viewModel.homeValue
        awayView.cardValue.text = viewModel.awayValue
        totalView.cardValue.text = viewModel.totalValue
    }

}
