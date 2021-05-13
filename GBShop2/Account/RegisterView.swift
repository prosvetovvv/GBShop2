//
//  SignUpView.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 07.05.2021.
//

import UIKit

class RegisterView: UIView {
    let stackView = UIStackView()
    let emailTextField = GBTextField(placeholder: "Email")
    let passwordTextField = GBTextField(placeholder: "Password")
    let nameTextField = GBTextField(placeholder: "Name")
    let lastnameTextField = GBTextField(placeholder: "Lastname")
    let cardTextField = GBTextField(placeholder: "Card number")
    let signUpButton = GBButton(backgroundColor: .systemBlue, title: "Sign up")
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .systemBackground
        setupStackView()
        setupPasswordTextField()
        setupCardTextField()
        setupSignUpButton()
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupStackView() {
        stackView.backgroundColor = .systemBackground
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 25.0
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(lastnameTextField)
        stackView.addArrangedSubview(cardTextField)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
    }
    
    private func setupPasswordTextField() {
        passwordTextField.isSecureTextEntry = true
    }
    
    private func setupCardTextField() {
        cardTextField.keyboardType = .numberPad
    }
    
    private func setupSignUpButton() {
        addSubview(signUpButton)
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40.0),
            
            emailTextField.widthAnchor.constraint(equalToConstant: 300.0),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.widthAnchor.constraint(equalToConstant: 300.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            nameTextField.widthAnchor.constraint(equalToConstant: 300.0),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            lastnameTextField.widthAnchor.constraint(equalToConstant: 300.0),
            lastnameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            cardTextField.widthAnchor.constraint(equalToConstant: 300.0),
            cardTextField.heightAnchor.constraint(equalToConstant: 40),
            
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50.0),
            signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signUpButton.widthAnchor.constraint(equalToConstant: 300.0),
            signUpButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}
