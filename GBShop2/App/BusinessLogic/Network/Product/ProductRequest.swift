//
//  ProductListRequest.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import Foundation
import Alamofire

struct ProductRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
}

extension ProductRequest: ProductRequestFactory {
    func getProductList(page: Int, id: Int, completionHandler: @escaping (AFDataResponse<ProductListResult>) -> Void) {
        let requestModel = ProductList(baseUrl: baseUrl, page: page, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
