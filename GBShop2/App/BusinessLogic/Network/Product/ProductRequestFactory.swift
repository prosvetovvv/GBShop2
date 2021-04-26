//
//  ProductListFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func getProductList(page: Int, id: Int, completionHandler: @escaping (AFDataResponse<ProductListResult>) -> Void)
}
