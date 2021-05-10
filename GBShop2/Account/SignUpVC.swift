//
//  SignUpVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 07.05.2021.
//

import UIKit

class SignUpVC: UIViewController {
    private let accountRequestFactory: AccountRequestFactory
    
    init(accountRequestFactory: AccountRequestFactory) {
        self.accountRequestFactory = accountRequestFactory
        super.init(nibName: nil, bundle: nil)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = SignUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Private
    
    private func setupView() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboardGesture)
    }
    
    // MARK: - Objc
    
    @objc
    func hideKeyboard() {
        view.endEditing(true)
    }
    
}
