//
//  CountryTableViewCell.swift
//  Livscore1
//
//  Created by Carlos Cardona on 05/05/22.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    var viewModel: CountriesTableViewViewModel!
    
    // TODO: Add Kingfisher repo to download the images from url
    
    var flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Constants.countryIdentifier)
        
        addSubviews()
        flagImageView.frame = CGRect(x: 5, y: 5, width: 40, height: 40)
        countryLabel.frame = CGRect(x: flagImageView.right + 5, y: 5, width: contentView.width - 6, height: 40)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    private func addSubviews() {
        contentView.addSubview(flagImageView)
        contentView.addSubview(countryLabel)
    }
    
    public func configure(with viewModel: CountriesTableViewViewModel) {
        
//        guard let url = URL(string: viewModel.countrFlag) else { return }
//        let data = try? Data(contentsOf: url)
//        let receivedImage: SVGKImage = SVGKImage(data: data)
        
        countryLabel.text = viewModel.countryName
//        flagImageView.image = receivedImage.uiImage
    }

}
