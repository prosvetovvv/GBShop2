//
//  ProductVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 05.05.2021.
//

import UIKit

class ProductVC: UIViewController {
    private let basketRequestFactory: BasketRequestFactory
    private let rootView: ProductView
    private let currentProduct: Product
    private var count = 1
    
    // MARK: - Init
    
    init(basketRequestFactory: BasketRequestFactory, currentProduct: Product) {
        self.basketRequestFactory = basketRequestFactory
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
        setupAddButton()
        setupCountPicker()
    }
    
    // MARK: - Private
    
    private func setupCountPicker() {
        rootView.countPicker.delegate = self
    }
    
    private func setupAddButton() {
        rootView.addButton.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
    }
    
    @objc
    private func tappedAddButton() {
        basketRequestFactory.addToBasket(productID: currentProduct.productID, category: currentProduct.category, name: currentProduct.name, price: currentProduct.price, count: self.count) { response in
            switch response.result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Extensions

extension ProductVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row + 1)"
    }
}

extension ProductVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        count = row + 1
    }
}
