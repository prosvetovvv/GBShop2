//
//  BasketRequestModels.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 28.04.2021.
//

import Foundation
import Alamofire

struct GetBasketModel: RequestRouter {
    var baseUrl: URL
    var method: HTTPMethod = .post
    var path = "get_basket"
    
    let userID: Int
    var parameters: Parameters? {
        ["userID": userID]
    }
}

struct AddToBasketModel: RequestRouter {
    var baseUrl: URL
    var method: HTTPMethod = .post
    var path = "add_to_basket"
    //let basketItem: BasketItem
    let productID: Int
    let categoryID: Int
    let name: String
    let price: Double
    let count: Int
    
    var parameters: Parameters? {
        ["product": [ "productID": productID,
                      "categoryID": categoryID,
                      "name": name,
                      "price": price],
         "count": count]
    }
}
