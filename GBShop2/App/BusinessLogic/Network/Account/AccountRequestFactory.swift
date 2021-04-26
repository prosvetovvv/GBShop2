//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation
import Alamofire

protocol AccountRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResponse>) -> Void)
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
    func editProfile(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<EditProfileResult>) -> Void)
}
