//
//  LoginVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 06.05.2021.
//

import UIKit

class LoginVC: UIViewController {
    private let accountRequestFactory: AccountRequestFactory
    private let signUpVC: RegisterAccountVC
    private let tabBarVC: TabBarVC
    private let rootView = LoginView()
    
    // MARK: - Init
    
    init(accountRequestFactory: AccountRequestFactory, tabBarVC: TabBarVC, signUpVC: RegisterAccountVC) {
        self.accountRequestFactory = accountRequestFactory
        self.tabBarVC = tabBarVC
        self.signUpVC = signUpVC
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardAppeared), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDisappeared(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissKeyboardTapGesture()
        setupSignInButton()
        setupSignUpButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Private
    
    private func setupSignInButton() {
        rootView.signInButton.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
    }
    
    private func setupSignUpButton() {
        rootView.signUpButton.addTarget(self, action: #selector(tappedSighUpButton), for: .touchUpInside)
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: rootView.scrollView, action: #selector(UIView.endEditing))
        rootView.scrollView.addGestureRecognizer(tap)
    }
    
    private func check(_ result: Int) {
        if result == 1 {
            DispatchQueue.main.async {
                self.tabBarVC.modalPresentationStyle = .fullScreen
                self.present(self.tabBarVC, animated: true, completion: nil)
                //self.navigationController?.pushViewController(self.tabBarVC, animated: true)
            }
        } else {
            self.presentGBAlertOnMainThread(title: "Error", message: "Incorrect data.", buttonTitle: "Ok", completionHandler: nil)
        }
    }
    
    // MARK: - Objc
    
    @objc
    private func tappedSignInButton() {
        let login = rootView.loginTextField.text ?? " "
        let password = rootView.passwordTextField.text ?? " "
        
        accountRequestFactory.login(userName: login, password: password) { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let response):
                self.check(response.result)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    @objc
    private func tappedSighUpButton() {
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    @objc
    private func keyboardAppeared(notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        rootView.scrollView.contentInset.bottom = keyboardSize.height
    }
    
    @objc
    private func keyboardDisappeared(notification: Notification) {
        rootView.scrollView.contentInset = UIEdgeInsets.zero
    }
    
    @objc
    func hideKeyboard() {
        rootView.scrollView.endEditing(true)
    }
}
