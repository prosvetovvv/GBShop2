//
//  User.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation

struct User: Codable {
    let userID: Int
    let login: String
    let name: String
    let lastname: String
    
//    enum CodingKeys: String, CodingKey {
//        case userID = "id_user"
//        case login = "user_login"
//        case name = "user_name"
//        case lastname = "user_lastname"
//    }
}
