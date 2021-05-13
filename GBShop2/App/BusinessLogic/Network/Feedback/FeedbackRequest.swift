//
//  FeedbackRequest.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 26.04.2021.
//

import Foundation
import Alamofire

class FeedbackRequest: AbstractRequestFactory {
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

extension FeedbackRequest: FeedbackRequestFactory {
    func addFeedback(userID: Int, text: String, completionHandler: @escaping (AFDataResponse<AddFeedbackResponse>) -> Void) {
        let requestModel = AddFeedbackModel(baseUrl: baseUrl, userID: userID, text: text)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func deleteFeedback(feedbackID: Int, completionHandler: @escaping (AFDataResponse<DeleteFeedbackResponse>) -> Void) {
        let requestModel = DeleteFeedbackModel(baseUrl: baseUrl, feedbackID: feedbackID)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getFeedbackList(name: String, completionHandler: @escaping (AFDataResponse<[Feedback]>) -> Void) {
        let requestModel = GEtFeedbackListModel(baseUrl: baseUrl, name: name)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
    
}
