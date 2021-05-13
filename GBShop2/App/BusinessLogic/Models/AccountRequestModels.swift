//
//  AccountRequestModels.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 13.04.2021.
//

import Foundation
import Alamofire

struct RegisterModel: RequestRouter {
    var baseUrl: URL
    var method: HTTPMethod = .post
    var path = "register"
    
    var user: User
    var parameters: Parameters? {
        [
            "email": user.email,
            "password": user.password,
            "name": user.name,
            "lastname": user.lastname,
            "creditCard": user.creditCard
        ]
    }
    
//    let email: String
//    let password: String
//    let name: String
//    let lastname: String
//    let creditCard: String
//    var parameters: Parameters? {
//        return [
//            "email": email,
//            "password": password,
//            "name": name,
//            "lastname": lastname,
//            "creditCard": creditCard
//        ]
//    }
}

struct LoginModel: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "login"
    
    let login: String
    let password: String
    var parameters: Parameters? {
        return [
            "username": login,
            "password": password
        ]
    }
}

struct LogoutModel: RequestRouter {
    var baseUrl: URL
    var method: HTTPMethod = .post
    var path: String = "logout"
    
    let idUser: Int
    var parameters: Parameters? {
        ["userID": idUser]
    }
}

struct EditProfileModel: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    //var path: String = "changeUserData.json"
    var path: String = "edit_profile"
    
    let id: Int
    let userName: String
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
    var parameters: Parameters? {
        ["id_user": id,
         "username": userName,
         "password": password,
         "email": email,
         "gender": gender,
         "credit_card": creditCard,
         "bio": bio
        ]
    }
    
}
