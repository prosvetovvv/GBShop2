//
//  ProductsTableVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 04.05.2021.
//

import UIKit

class ProductsTableVC: UITableViewController {
    private let productRequestFactory: ProductRequestFactory
    private let basketRequestFactory: BasketRequestFactory
    private let feedbackRequestFactory: FeedbackRequestFactory
    private let cellId = "productCell"
    private var products = [Product]()
    private let category: Category
    
    // MARK: - Init
    
    init(productRequestFactory: ProductRequestFactory, basketRequestFactory: BasketRequestFactory, feedbackRequestFactory: FeedbackRequestFactory, category: Category) {
        self.productRequestFactory = productRequestFactory
        self.basketRequestFactory = basketRequestFactory
        self.feedbackRequestFactory = feedbackRequestFactory
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getProducts()
    }
    
    // MARK: - Privates
    
    private func setup() {
        title = category.rawValue
        navigationController?.navigationBar.prefersLargeTitles = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func getProducts() {
        productRequestFactory.getProductList(category: category) { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let products):
                DispatchQueue.main.async {
                    self.products = products
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let product = products[indexPath.row]
        
        cell.textLabel?.text = product.name
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let productVC = ProductVC(basketRequestFactory: basketRequestFactory, feedbackRequestFactory: feedbackRequestFactory, currentProduct: product)
        productVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(productVC, animated: true)
    }
}
