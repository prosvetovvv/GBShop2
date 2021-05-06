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
    let loginTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        setupScrollView()
        setupLogoImageView()
        setupLoginTextField()
        setupPasswordTextField()
        setupLoginButton()
        
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
        
        loginTextField.placeholder = "  Login"
        loginTextField.text = "user"
        loginTextField.layer.cornerRadius = 10.0
        loginTextField.layer.borderWidth = 1.5
        loginTextField.layer.borderColor = UIColor.systemGray.cgColor
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(loginTextField)
    }
    
    private func setupPasswordTextField() {
        passwordTextField.placeholder = "  Password"
        passwordTextField.text = "password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 10.0
        passwordTextField.layer.borderWidth = 1.5
        passwordTextField.layer.borderColor = UIColor.systemGray.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(passwordTextField)
    }
    
    private func setupLoginButton() {
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitle("Login", for: .normal)
        loginButton.layer.cornerRadius = 10.0
        loginButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(loginButton)
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
            
            loginButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40.0),
            loginButton.widthAnchor.constraint(equalToConstant: 300.0),
            loginButton.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }


}
