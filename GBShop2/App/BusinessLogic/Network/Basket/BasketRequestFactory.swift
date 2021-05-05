//
//  BasketRequestFactory.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 28.04.2021.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    func getBasket(userID: Int, completionHandler: @escaping (AFDataResponse<[BasketItem]>) -> Void)
    func addToBasket(productID: Int, category: String, name: String, price: Double, count: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResponse>) -> Void)
}
