//
//  LoginResult.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation

struct LoginResponse: Codable {
    let result: Int
    let user: User
}
