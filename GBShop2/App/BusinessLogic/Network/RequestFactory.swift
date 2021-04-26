//
//  RequestFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    let sessionQueue: DispatchQueue
    let baseUrl: URL
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    init (sessionQueue: DispatchQueue, baseUrl: URL) {
        self.sessionQueue = sessionQueue
        self.baseUrl = baseUrl
    }
     
    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }
    
    func makeAccountRequestFactory() -> AccountRequestFactory {
        let errorParser = makeErrorParser()
        return AccountRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeProductRequestFactory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return ProductRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
    
    func makeFeedbackRequestFactory() -> FeedbackRequestFactory {
        let errorParser = makeErrorParser()
        return FeedbackRequest(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue, baseUrl: baseUrl)
    }
}
