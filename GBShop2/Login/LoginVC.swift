//
//  LoginVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 06.05.2021.
//

import UIKit

class LoginVC: UIViewController {
    private let accountRequestFactory: AccountRequestFactory
    private let productRequestFactory: ProductRequestFactory
    private let basketRequestFactory: BasketRequestFactory
    private let destinationVC: TabBarVC
    private let rootView = LoginView()
    
    // MARK: - Init
    
    init(accountRequestFactory: AccountRequestFactory, productRequestFactory: ProductRequestFactory, basketRequestFactory: BasketRequestFactory) {
        self.accountRequestFactory = accountRequestFactory
        self.productRequestFactory = productRequestFactory
        self.basketRequestFactory = basketRequestFactory
        self.destinationVC = TabBarVC(basketRequestFactory: basketRequestFactory, productRequestFactory: productRequestFactory)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupLoginButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Private
    
    private func setupScrollView() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        rootView.scrollView.addGestureRecognizer(hideKeyboardGesture)
    }
    
    private func setupLoginButton() {
        rootView.loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
    }
    
    private func check(_ result: Int) {
        if result == 1 {
            DispatchQueue.main.async {
                self.destinationVC.modalPresentationStyle = .fullScreen
                self.present(self.destinationVC, animated: true, completion: nil)
                //self.navigationController?.pushViewController(self.destinationVC, animated: true)
            }
        } else {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: "Incorrect data", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Objc
    
    @objc
    private func tappedLoginButton() {
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
    private func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        rootView.scrollView.contentInset = contentInsets
        rootView.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc
    private func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        rootView.scrollView.contentInset = contentInsets
    }
    
    @objc
    func hideKeyboard() {
        rootView.scrollView.endEditing(true)
    }
}