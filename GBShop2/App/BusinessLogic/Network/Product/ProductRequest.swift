//
//  ProductListRequest.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import Foundation
import Alamofire

class ProductRequest: AbstractRequestFactory {
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

extension ProductRequest: ProductRequestFactory {
    func getProductList(category: Category, completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {
        let requestModel = ProductListModel(baseUrl: baseUrl, category: category)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
