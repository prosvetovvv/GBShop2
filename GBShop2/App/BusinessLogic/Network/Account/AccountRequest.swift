//
//  Auth.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation
import Alamofire

struct AccountRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
}

extension AccountRequest: AccountRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResponse>) -> Void) {
        let requestModel = LoginModel(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = LogoutModel(baseUrl: baseUrl, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func editProfile(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<EditProfileResult>) -> Void) {
        let requestModel = EditProfileModel(baseUrl: baseUrl, id: id, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
