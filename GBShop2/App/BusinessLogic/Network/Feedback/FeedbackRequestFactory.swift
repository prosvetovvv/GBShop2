//
//  FeedbackRequestFactory.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 26.04.2021.
//

import Foundation
import Alamofire

protocol FeedbackRequestFactory {
    func addFeedback(userID: Int, text: String, completionHandler: @escaping (AFDataResponse<AddFeedbackResponse>) -> Void)
    func deleteFeedback(feedbackID: Int, completionHandler: @escaping (AFDataResponse<DeleteFeedbackResponse>) -> Void)
    func getFeedbackList(name: String, completionHandler: @escaping (AFDataResponse<[Feedback]>) -> Void)
}
