//
//  User.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation

struct User: Codable {
    let email: String
    let password: String
    let name: String
    let lastname: String
    let creditCard: String
}
