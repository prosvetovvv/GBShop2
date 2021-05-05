//
//  CategoryTableVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 29.04.2021.
//

import UIKit

class CategoryTableVC: UITableViewController {
    private let productRequestFactory: ProductRequestFactory
    
    //private let categories = ["Processors", "Motherboards", "HDD", "RAM", "Video"]
//    private var categories: [String] {
//        var result = [String]()
//        Category.allCases.forEach {
//            result.append($0.rawValue)
//        }
//        return result
//    }
    
    private let cellId = "categoryCell"
    
    // MARK: - Init
    
    init(productRequestFactory: ProductRequestFactory) {
        self.productRequestFactory = productRequestFactory
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
        //categories.count
        Category.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        //cell.textLabel?.text = categories[indexPath.row]
        cell.textLabel?.text = Category.allCases[indexPath.row].rawValue
        
        return cell
    }
    
    // MARK: - Table view data delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let category = categories[indexPath.row]
        let category = Category.allCases[indexPath.row]
        
        let destinationVC = ProductsTableVC(productRequestFactory: productRequestFactory, category: category)
        destinationVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(destinationVC, animated: true)
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
