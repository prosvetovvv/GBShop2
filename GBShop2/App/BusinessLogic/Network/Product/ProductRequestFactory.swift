//
//  ProductListFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func getProductList(categoryID: Int, completionHandler: @escaping (AFDataResponse<GetProductListResponse>) -> Void)
}
