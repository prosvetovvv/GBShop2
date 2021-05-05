//
//  ProductRequestProduct.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import Foundation
import Alamofire

struct ProductListModel: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "get_products"
    
    let category: Category
    var parameters: Parameters? {
        return [
            "category": category.rawValue
        ]
    }
}
