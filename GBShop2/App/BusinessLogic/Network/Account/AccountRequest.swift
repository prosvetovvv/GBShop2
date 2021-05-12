//
//  Auth.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation
import Alamofire

class AccountRequest: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL
    
    init(errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue, baseUrl: URL) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

extension AccountRequest: AccountRequestFactory {
    func register(user: User, completionHandler: @escaping (AFDataResponse<RegisterResponse>) -> Void) {
        let requestModel = RegisterModel(baseUrl: baseUrl, user: user)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
//    func register(email: String, password: String, name: String, lastname: String, card: String, completionHandler: @escaping (AFDataResponse<RegisterResponse>) -> Void) {
//        //let requestModel = RegisterModel(baseUrl: baseUrl, email: email, password: password, name: name, lastname: lastname, creditCard: card)
//        let requestModel = RegisterModel(baseUrl: baseUrl, user: user)
//        self.request(request: requestModel, completionHandler: completionHandler)
//    }
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResponse>) -> Void) {
        let requestModel = LoginModel(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResponse>) -> Void) {
        let requestModel = LogoutModel(baseUrl: baseUrl, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func editProfile(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<EditProfileResponse>) -> Void) {
        let requestModel = EditProfileModel(baseUrl: baseUrl, id: id, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}
