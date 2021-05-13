//
//  ProductView.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 05.05.2021.
//

import UIKit

class ProductView: UIView {
    private let productName: String
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let nameLabel = UILabel()
    private let productImageView = UIImageView()
    private let countStackView = UIStackView()
    private let countLabel = GBSecondaryTitleLabel(fontSize: 20.0)
    var feedbacks: [Feedback]? { didSet { updateFeedbacks() } }
    let countTextField = GBTextField(placeholder: nil)
    let countPicker = UIPickerView()
    let addToBasketButton = GBButton(backgroundColor: .systemBlue, title: "Add to basket")
    let addButton = UIButton()
    let feedbackStackView = UIStackView()
    
    // MARK: - Init
    
    init(productName: String) {
        self.productName = productName
        super.init(frame: .zero)
        
        setupSelf()
        setupScrollView()
        setupContainerView()
        setupProductImageView()
        setupNameLabel()
        setupCountStackView()
        setupCountLabel()
        setupCountTextField()
        setupAddButton()
        setupFeedbackStackView()
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupSelf() {
        backgroundColor = .systemBackground
    }
    
    private func setupScrollView() {
        scrollView.backgroundColor = .systemBackground
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .systemBackground
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(containerView)
    }
    
    private func setupProductImageView() {
        productImageView.image = UIImage(systemName: "cube")
        productImageView.layer.cornerRadius = 10
        productImageView.clipsToBounds = true
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(productImageView)
    }
    
    private func setupNameLabel() {
        nameLabel.text = productName
        nameLabel.textColor = .label
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.9
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(nameLabel)
    }
    
    private func setupCountStackView() {
        countStackView.axis = .horizontal
        countStackView.alignment = .center
        countStackView.translatesAutoresizingMaskIntoConstraints = false
        
        countStackView.addArrangedSubview(countLabel)
        countStackView.addArrangedSubview(countTextField)
        countStackView.addArrangedSubview(addToBasketButton)
        
        containerView.addSubview(countStackView)
    }
    
    private func setupCountLabel() {
        countLabel.text = "Count:"
    }
    
    private func setupCountTextField() {
        countTextField.text = "1"
        countTextField.keyboardType = .numberPad
    }
    
    private func setupAddButton() {
        addButton.backgroundColor = .systemBlue
        addButton.setTitle("Add to basket", for: .normal)
        addButton.layer.cornerRadius = 10.0
        addButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        addButton.setTitleColor(.white, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupFeedbackStackView() {
        feedbackStackView.spacing = 15.0
        feedbackStackView.axis = .vertical
        feedbackStackView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(feedbackStackView)
    }
    
    private func updateFeedbacks() {
        guard let feedbacks = feedbacks else { return }
        
        feedbacks.forEach {
            let feedbackLabel = GBBodyLabel(textAlignment: .left)
            feedbackLabel.text = $0.text
            feedbackStackView.addArrangedSubview(feedbackLabel)
        }
        
        feedbackStackView.setNeedsDisplay()
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            
            productImageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 50.0),
            productImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 150.0),
            productImageView.heightAnchor.constraint(equalToConstant: 150.0),
            
            nameLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 50.0),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor, constant: 30.0),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor, constant: -30.0),
            nameLabel.heightAnchor.constraint(equalToConstant: 35.0),
            
            countStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40.0),
            countStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            countStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20.0),
            countStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20.0),
            
            countLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            countTextField.widthAnchor.constraint(equalToConstant: 40.0),
            countTextField.heightAnchor.constraint(equalToConstant: 40.0),
            countTextField.trailingAnchor.constraint(equalTo: addToBasketButton.leadingAnchor, constant: -20.0),
            
            addToBasketButton.widthAnchor.constraint(equalToConstant: 180.0),
            addToBasketButton.heightAnchor.constraint(equalToConstant: 40.0),
            
            feedbackStackView.topAnchor.constraint(equalTo: countStackView.bottomAnchor, constant: 20.0),
            feedbackStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10.0),
            feedbackStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10.0)
        ])
    }
}
