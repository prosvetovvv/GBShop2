//
//  BasketItemCell.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 29.04.2021.
//

import UIKit

class BasketItemCell: UITableViewCell {
    static let id = "BasketItemCell"
    let nameLabel = UILabel()
    let countLabel = UILabel()
    let priceLabel = UILabel()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupNameLabel()
        setupCountLabel()
        setupPriceLabel()
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    
    func set(with basketItem: BasketItem) {
        nameLabel.text = basketItem.product.name
        countLabel.text = "\(basketItem.count)"
        priceLabel.text = "\(basketItem.product.price) р."
    }
    
    // MARK: - Setup UI elements
    
    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .label
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.9
        nameLabel.numberOfLines = 1
        nameLabel.lineBreakMode = .byTruncatingTail
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupCountLabel() {
        addSubview(countLabel)
        countLabel.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        countLabel.textAlignment = .left
        countLabel.textColor = .secondaryLabel
        countLabel.adjustsFontSizeToFitWidth = true
        countLabel.minimumScaleFactor = 0.9
        countLabel.numberOfLines = 1
        countLabel.lineBreakMode = .byTruncatingTail
        countLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupPriceLabel() {
        addSubview(priceLabel)
        priceLabel.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        priceLabel.textAlignment = .left
        priceLabel.textColor = .label
        priceLabel.adjustsFontSizeToFitWidth = true
        priceLabel.minimumScaleFactor = 0.9
        priceLabel.numberOfLines = 1
        priceLabel.lineBreakMode = .byTruncatingTail
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -10.0),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.0),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50.0),
            nameLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            countLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12.0),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50.0),
            countLabel.heightAnchor.constraint(equalToConstant: 15.0),
            
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12.0),
            priceLabel.widthAnchor.constraint(equalToConstant: 100.0),
            priceLabel.heightAnchor.constraint(equalToConstant: 35.0)
        ])
    }
}
