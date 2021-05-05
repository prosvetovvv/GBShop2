//
//  ProductView.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 05.05.2021.
//

import UIKit

class ProductView: UIView {
    private let productName: String
    
    private let nameLabel = UILabel()
    private let productImageView = UIImageView()
    private let countLabel = UILabel()
    let countPicker = UIPickerView()
    let addButton = UIButton()
    
    // MARK: - Init
    
    init(productName: String) {
        self.productName = productName
        super.init(frame: .zero)
        
        setupSelf()
        setupProductImageView()
        setupNameLabel()
        setupCountLabel()
        setupCountPicker()
        setupAddButton()
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI elements
    
    func setupSelf() {
        backgroundColor = .systemBackground
    }
    
    func setupProductImageView() {
        productImageView.image = UIImage(systemName: "cube")
        productImageView.layer.cornerRadius = 10
        productImageView.clipsToBounds = true
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(productImageView)
    }
    
    func setupNameLabel() {
        nameLabel.text = productName
        nameLabel.textColor = .label
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.9
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
    }
    
    func setupCountLabel() {
        countLabel.text = "Count:"
        countLabel.textColor = .label
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .medium)
        countLabel.adjustsFontSizeToFitWidth = true
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(countLabel)
    }
    
    func setupCountPicker() {
        countPicker.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(countPicker)
    }
    
    func setupAddButton() {
        addButton.backgroundColor = .systemBlue
        addButton.setTitle("Add to basket", for: .normal)
        addButton.layer.cornerRadius = 10.0
        addButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        addButton.setTitleColor(.white, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(addButton)
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50.0),
            productImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 150.0),
            productImageView.heightAnchor.constraint(equalToConstant: 150.0),
            
            nameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 50.0),
            nameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30.0),
            nameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30.0),
            nameLabel.heightAnchor.constraint(equalToConstant: 35.0),
            
            countLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40.0),
            countLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30.0),
            countLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30.0),
            countLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            countPicker.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 10.0),
            countPicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            countPicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50.0),
            addButton.widthAnchor.constraint(equalToConstant: 200.0),
            addButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
