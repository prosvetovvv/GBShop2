//
//  AppDelegate.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 26.04.2021.
//

import UIKit

struct AppConfig {
    static let sessionQueue = DispatchQueue.global(qos: .utility)
    //static let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    static let baseUrl = URL(string: "https://powerful-reef-79731.herokuapp.com/")!

//    static var baseUrl: URL {
//        var components = URLComponents()
//        components.scheme = "http"
//        components.host = "localhost"
//        components.port = 8080
//        return components.url!
//    }
}

@main

class AppDelegate: UIResponder, UIApplicationDelegate {
    var requestFactory = RequestFactory(sessionQueue: AppConfig.sessionQueue, baseUrl: AppConfig.baseUrl)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let accountRequestFactory = requestFactory.makeAccountRequestFactory()
        //let productRequestFactory = requestFactory.makeProductRequestFactory()
        
        accountRequestFactory.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        accountRequestFactory.logout(idUser: 123) { response in
            switch response.result {
            case .success(let quit):
                print(quit)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
//        accountRequestFactory.editProfile(id: 123,
//                                          userName: "Somebody",
//                                          password: "mypassword",
//                                          email: "some@some.ru",
//                                          gender: "m",
//                                          creditCard: "9872389-2424-234224-234",
//                                          bio: "This is good! I think I will switch to another language") { response in
//            switch response.result {
//            case .success(let edit):
//                print(edit)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
//        productRequestFactory.getProductList(page: 1, id: 1) { response in
//            switch response.result {
//            case .success(let list):
//                print(list)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        return true
    }
}


