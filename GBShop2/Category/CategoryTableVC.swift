//
//  CategoryTableVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 29.04.2021.
//

import UIKit

class CategoryTableVC: UITableViewController {
    private let productRequestFactory: ProductRequestFactory
    private let basketRequestFactory: BasketRequestFactory
    private let cellId = "categoryCell"
    
    // MARK: - Init
    
    init(productRequestFactory: ProductRequestFactory, basketRequestFactory: BasketRequestFactory) {
        self.productRequestFactory = productRequestFactory
        self.basketRequestFactory = basketRequestFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARL: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    // MARK: - Privates
    
    private func setupTable() {
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Category.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = Category.allCases[indexPath.row].rawValue
        
        return cell
    }
    
    // MARK: - Table view data delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = Category.allCases[indexPath.row]
        
        let destinationVC = ProductsTableVC(productRequestFactory: productRequestFactory, basketRequestFactory: basketRequestFactory, category: category)
        destinationVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
