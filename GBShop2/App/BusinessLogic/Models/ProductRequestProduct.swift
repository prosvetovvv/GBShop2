//
//  ProductRequestProduct.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import Foundation
import Alamofire

struct ProductList: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "catalogData.json"
    
    let page: Int
    let id: Int
    var parameters: Parameters? {
        return [
            "page_number": page,
            "id_category": id
        ]
    }
}
