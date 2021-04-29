//
//  BasketRequest.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 28.04.2021.
//

import Foundation
import Alamofire

class BasketRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue, baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension BasketRequest: BasketRequestFactory {
    func getBasket(userID: Int, completionHandler: @escaping (AFDataResponse<[BasketItem]>) -> Void) {
        let requestModel = GetBasketModel(baseUrl: baseUrl, userID: userID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func addToBasket(productID: Int, categoryID: Int, name: String, price: Double, count: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResponse>) -> Void) {
        let requestModel = AddToBasketModel(baseUrl: baseUrl, productID: productID, categoryID: categoryID, name: name, price: price, count: count)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    

}

