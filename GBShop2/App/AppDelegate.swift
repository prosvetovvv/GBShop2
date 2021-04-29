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
        let feedbackRequestFactory = requestFactory.makeFeedbackRequestFactory()
        let productRequestFactory = requestFactory.makeProductRequestFactory()
        let basketRequestFactory = requestFactory.makeBasketRequestFactory()
        
//        accountRequestFactory.login(userName: "Somebody", password: "mypassword") { response in
//            switch response.result {
//            case .success(let login):
//                print(login)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        
//        accountRequestFactory.logout(idUser: 123) { response in
//            switch response.result {
//            case .success(let quit):
//                print(quit)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        
//        feedbackRequestFactory.addFeedback(userID: 123, text: "Good product") { response in
//            switch response.result {
//            case .success(let feedback):
//                print(feedback)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        
//        feedbackRequestFactory.deleteFeedback(feedbackID: 24) { response in
//            switch response.result {
//            case .success(let feedback):
//                print(feedback)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//        
//        feedbackRequestFactory.getFeedbackList(productID: 111) { response in
//            switch response.result {
//            case .success(let list):
//                print(list)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
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
        
//        productRequestFactory.getProductList(categoryID: 11) { response in
//            switch response.result {
//            case .success(let list):
//                print(list)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        
        let newProduct = Product(productID: 222, categoryID: 22, name: "Product2", price: 200.0)
        //let newBasketItem = BasketItem(product: newProduct, count: 1)

        basketRequestFactory.addToBasket(productID: newProduct.productID, categoryID: newProduct.categoryID, name: newProduct.name, price: newProduct.price, count: 1) { response in
            switch response.result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
//        basketRequestFactory.getBasket(userID: 123) { response in
//            switch response.result {
//            case .success(let basketItems):
//                print(basketItems)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        return true
    }
}


