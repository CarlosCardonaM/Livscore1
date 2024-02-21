//
//  MoreHeaderView.swift
//  Livscore1
//
//  Created by Carlos Cardona on 19/02/24.
//

import UIKit

class MoreHeaderView: UIView {

    var moreTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "More"
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(hexString: HexColors.darkBackground.description)
        
        addSubviews()
        
        NSLayoutConstraint.activate([
            moreTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            moreTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            moreTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            moreTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(moreTitleLabel)
    }
}
