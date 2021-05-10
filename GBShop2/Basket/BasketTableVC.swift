//
//  BasketTableVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 27.04.2021.
//

import UIKit

class BasketTableVC: UITableViewController {
    private let basketRequestFactory: BasketRequestFactory
    private var basketItems = [BasketItem]()
    
    // MARK: - Init
    
    init(basketRequestFactory: BasketRequestFactory) {
        self.basketRequestFactory = basketRequestFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getBasket()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Private
    
    private func setup() {
        tableView.rowHeight = 80
        tableView.register(BasketItemCell.self, forCellReuseIdentifier: BasketItemCell.id)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func getBasket() {
        basketRequestFactory.getBasket(userID: 123) { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let basketItems):
                DispatchQueue.main.async {
                    self.basketItems = basketItems
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basketItem = self.basketItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketItemCell.id, for: indexPath) as! BasketItemCell
        
        cell.set(with: basketItem)
        
        return cell
    }
}
