//
//  FeedbackRequestModels.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 26.04.2021.
//

import Foundation
import Alamofire

struct AddFeedbackModel: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "add_feedback"
    
    let userID: Int
    let text: String
    var parameters: Parameters? {
        return [
            "userID": userID,
            "text": text
        ]
    }
}

struct DeleteFeedbackModel: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "delete_feedback"
    
    let feedbackID: Int
    var parameters: Parameters? {
        return [
            "feedbackID": feedbackID
        ]
    }
}

struct GEtFeedbackListModel: RequestRouter {
    let baseUrl: URL
    let method: HTTPMethod = .post
    let path: String = "get_feedback_list"
    
    let productID: Int
    var parameters: Parameters? {
        return [
            "productID": productID
        ]
    }
}
