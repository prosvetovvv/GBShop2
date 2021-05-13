//
//  LoginView.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 06.05.2021.
//

import UIKit

class LoginView: UIView {
    private let logoImageView = UIImageView()
    let scrollView = UIScrollView()
    let containerView = UIView()
    let loginTextField = GBTextField(placeholder: "Login")
    let passwordTextField = GBTextField(placeholder: "Password")
    let signInButton = GBButton(backgroundColor: .systemBlue, title: "Sign in")
    let signUpButton = UIButton()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        setupScrollView()
        setupContainerView()
        setupLogoImageView()
        setupLoginTextField()
        setupPasswordTextField()
        setupSignInButton()
        setupSignUpButton()
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
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
    
    private func setupLogoImageView() {
        logoImageView.image = UIImage(systemName: "cube")
        logoImageView.layer.cornerRadius = 10
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(logoImageView)
    }
    
    private func setupLoginTextField() {
        loginTextField.text = "user"

        containerView.addSubview(loginTextField)
    }
    
    private func setupPasswordTextField() {
        passwordTextField.text = "password"
        passwordTextField.isSecureTextEntry = true

        containerView.addSubview(passwordTextField)
    }
    
    private func setupSignInButton() {
        containerView.addSubview(signInButton)
    }
    
    private func setupSignUpButton() {
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        signUpButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        containerView.addSubview(signUpButton)
    }
    
    //MARK: - Layout
    
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
            
            logoImageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 60.0),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 180.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 180.0),
            
            loginTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loginTextField.bottomAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -10.0),
            loginTextField.widthAnchor.constraint(equalToConstant: 300.0),
            loginTextField.heightAnchor.constraint(equalToConstant: 40.0),
            
            passwordTextField.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 10.0),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40.0),
            
            signInButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -40.0),
            signInButton.widthAnchor.constraint(equalToConstant: 300.0),
            signInButton.heightAnchor.constraint(equalToConstant: 40.0),
            
            signUpButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -20.0)
        ])
    }
}
