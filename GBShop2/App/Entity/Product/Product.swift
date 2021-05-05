//
//  Product.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import Foundation

enum Category: String, CaseIterable {
    case processors
    case motherboards
    case hdd
    case ram
    case video
}

struct Product: Codable {
    let productID: Int
    let category: String
    let name: String
    let price: Double
}
