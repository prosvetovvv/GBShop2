//
//  AppConfig.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 05.05.2021.
//

import Foundation

struct AppConfig {
    static let sessionQueue = DispatchQueue.global(qos: .utility)
    static let baseUrl = URL(string: "https://powerful-reef-79731.herokuapp.com/")!
    
//    static var baseUrl: URL {
//        var components = URLComponents()
//        components.scheme = "http"
//        components.host = "localhost"
//        components.port = 8080
//        return components.url!
//    }
}
