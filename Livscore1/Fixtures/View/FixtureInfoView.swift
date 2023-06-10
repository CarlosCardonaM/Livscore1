//
//  FixtureInfoView.swift
//  Livscore1
//
//  Created by Carlos Cardona on 17/05/22.
//

import UIKit

class FixtureInfoView: UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 14, style: fonts.light.description)
        label.textColor = .white
        label.text = "Hello world"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .scriptFont(size: 14, style: fonts.black.description)
        label.textColor = .white
        label.text = "Hello world"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.backgroundColor = UIColor(hexString: HexColors.darkSecondaryBackgound.description)
        addSubview(titleLabel)
        addSubview(valueLabel)
    }
    
}
