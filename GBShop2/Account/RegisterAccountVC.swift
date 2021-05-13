//
//  SignUpVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 07.05.2021.
//

import UIKit

class RegisterAccountVC: UIViewController {
    private let accountRequestFactory: AccountRequestFactory
    private let tabBarVC: TabBarVC
    private let rootView = RegisterView()
    
    init(accountRequestFactory: AccountRequestFactory, tabBarVC: TabBarVC) {
        self.accountRequestFactory = accountRequestFactory
        self.tabBarVC = tabBarVC
        super.init(nibName: nil, bundle: nil)
        
        setupView()
        setupSignUpButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    // MARK: - Private
    
    private func setupView() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboardGesture)
    }
    
    private func setupSignUpButton() {
        rootView.signUpButton.addTarget(self, action: #selector(tappedSignUpButton), for: .touchUpInside)
    }
    
    private func createNewUser() -> User{
        User(email: rootView.emailTextField.text ?? "",
             password: rootView.passwordTextField.text ?? "",
             name: rootView.nameTextField.text ?? "",
             lastname: rootView.lastnameTextField.text ?? "",
             creditCard: rootView.cardTextField.text ?? "")
    }
    
    private func check(_ successResult: RegisterResponse) {
        if successResult.result == 0 {
            self.presentGBAlertOnMainThread(title: "Error", message: successResult.message, buttonTitle: "Ok", completionHandler: nil)
        }
        
        if successResult.result == 1 {
            self.presentGBAlertOnMainThread(title: "Registration successful",
                                            message: "Congratulations! You registered.",
                                            buttonTitle: "Ok") {
                self.tabBarVC.modalPresentationStyle = .fullScreen
                self.present(self.tabBarVC, animated: true, completion: nil)
            }
            
        }
    }
    
    // MARK: - Objc
    
    @objc
    private func tappedSignUpButton() {
        let newUser = createNewUser()
        
        accountRequestFactory.register(user: newUser) { response in
            switch response.result {
            case .success(let result):
                self.check(result)
                debugPrint("Registration successful")
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }
}
