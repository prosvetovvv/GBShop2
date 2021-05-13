//
//  ProductVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 05.05.2021.
//

import UIKit

class ProductVC: UIViewController {
    private let basketRequestFactory: BasketRequestFactory
    private let feedbackRequestFactory: FeedbackRequestFactory
    private let rootView: ProductView
    private let currentProduct: Product
    private var count = 1
    private var feedbacks: [Feedback]?
    
    // MARK: - Init
    
    init(basketRequestFactory: BasketRequestFactory, feedbackRequestFactory: FeedbackRequestFactory, currentProduct: Product) {
        self.basketRequestFactory = basketRequestFactory
        self.feedbackRequestFactory = feedbackRequestFactory
        self.currentProduct = currentProduct
        self.rootView = ProductView(productName: currentProduct.name)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDismissKeyboardTapGesture()
        setupAddToBasketButton()
        getFeedbacks()
    }
    
    // MARK: - Private
    
    private func getFeedbacks() {
        feedbackRequestFactory.getFeedbackList(name: currentProduct.name) { response in
            switch response.result {
            case .success(let feedbacks):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.rootView.feedbacks = feedbacks
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    private func setupAddToBasketButton() {
        rootView.addToBasketButton.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: rootView, action: #selector(UIView.endEditing))
        rootView.addGestureRecognizer(tap)
    }
    
    // MARK: - Objc
    
    @objc
    private func tappedAddButton() {
        let count = Int(rootView.countTextField.text!) ?? 1
        
        basketRequestFactory.addToBasket(productID: currentProduct.productID, category: currentProduct.category, name: currentProduct.name, price: currentProduct.price, count: count) { response in
            switch response.result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        rootView.endEditing(true)
    }
}
