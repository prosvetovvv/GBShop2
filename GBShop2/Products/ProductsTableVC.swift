//
//  ProductsTableVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 04.05.2021.
//

import UIKit

class ProductsTableVC: UITableViewController {
    private let productRequestFactory: ProductRequestFactory
    private let cellId = "productCell"
    private var products = [Product]()
    private let category: Category
    
    // MARK: - Init
    
    init(productRequestFactory: ProductRequestFactory, category: Category) {
        self.productRequestFactory = productRequestFactory
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
                self.products = products
                DispatchQueue.main.async { self.tableView.reloadData() }
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
