//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation
import Alamofire

protocol AccountRequestFactory {
    //func register(email: String, password: String, name: String, lastname: String, card: String, completionHandler: @escaping (AFDataResponse<RegisterResponse>) -> Void)
    
    func register(user: User, completionHandler: @escaping (AFDataResponse<RegisterResponse>) -> Void) 
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResponse>) -> Void)
    
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResponse>) -> Void)
    
    func editProfile(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<EditProfileResponse>) -> Void)
}
