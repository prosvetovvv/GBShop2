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
    let loginTextField = GBTextField(placeholder: "Login")
    let passwordTextField = GBTextField(placeholder: "Password")
    let signInButton = GBButton(backgroundColor: .systemBlue, title: "Sign in")
    let signUpButton = UIButton()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        setupScrollView()
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
        //scrollView.contentSize = CGSize(width: frame.width, height: frame.height)
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
    }
    
    private func setupLogoImageView() {
        logoImageView.image = UIImage(systemName: "cube")
        logoImageView.layer.cornerRadius = 10
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(logoImageView)
    }
    
    private func setupLoginTextField() {
        loginTextField.text = "user"
        
        scrollView.addSubview(loginTextField)
    }
    
    private func setupPasswordTextField() {
        passwordTextField.text = "password"
        passwordTextField.isSecureTextEntry = true
        
        scrollView.addSubview(passwordTextField)
    }
    
    private func setupSignInButton() {        
        scrollView.addSubview(signInButton)
    }
    
    private func setupSignUpButton() {
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        signUpButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(signUpButton)
    }
    
    //MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60.0),
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 180.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 180.0),
            
            loginTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginTextField.bottomAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -10.0),
            loginTextField.widthAnchor.constraint(equalToConstant: 300.0),
            loginTextField.heightAnchor.constraint(equalToConstant: 40.0),
            
            passwordTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: 10.0),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300.0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40.0),
            
            signInButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -40.0),
            signInButton.widthAnchor.constraint(equalToConstant: 300.0),
            signInButton.heightAnchor.constraint(equalToConstant: 40.0),
            
            signUpButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20.0)
        ])
    }
}
