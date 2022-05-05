//
//  CardView.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class CardView: UIView {
    
    var cardTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .scriptFont(size: 18, style: fonts.regular.description)
        return label
    }()
    var cardValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .scriptFont(size: 28, style: fonts.light.description)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        
        self.addSubview(cardTitle)
        self.addSubview(cardValue)
        
        layer.cornerRadius = 10
            
        cardTitle.frame = CGRect(x: self.left + 10, y: 10, width: 90, height: 25)
        cardValue.frame = CGRect(x: 10, y: cardTitle.bottom + 20, width: 90, height: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
