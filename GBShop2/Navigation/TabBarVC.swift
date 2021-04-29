//
//  TabBarVC.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 27.04.2021.
//

import UIKit

class TabBarVC: UITabBarController {
    
    private let basketRequestFactory: BasketRequestFactory
    
    init(basketRequestFactory: BasketRequestFactory) {
        self.basketRequestFactory = basketRequestFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [createCategoryNC(), createBasketNC(basketRequestFactory: basketRequestFactory)]
    }
    
    func createCategoryNC() -> UINavigationController {
        let categoryVC = CategoryTableVC()
        categoryVC.title = "Category"
        categoryVC.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "square.grid.3x3"), selectedImage: UIImage(systemName: "square.grid.3x3.fill"))
        
        return UINavigationController(rootViewController: categoryVC)
    }
    
    func createBasketNC(basketRequestFactory: BasketRequestFactory) -> UINavigationController {
        let basketVC = BasketTableVC(basketRequestFactory: basketRequestFactory)
        basketVC.title = "Basket"
        basketVC.tabBarItem = UITabBarItem(title: "Basket", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        
        return UINavigationController(rootViewController: basketVC)
    }
    


}
