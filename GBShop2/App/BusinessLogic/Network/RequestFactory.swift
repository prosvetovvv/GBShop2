//
//  RequestFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation
import Alamofire

struct RequestFactory {
    let sessionQueue: DispatchQueue
    let baseUrl: URL
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        //configuration.headers = ["Content-Type": "application/json", "Content-Length": "calculated when request is sent"]
        let manager = Session(configuration: configuration)
        return manager
    }()
     
    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }
    
    mutating func makeAccountRequestFactory() -> AccountRequestFactory {
        let errorParser = makeErrorParser()
        return AccountRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    mutating func makeProductRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return ProductRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
}
