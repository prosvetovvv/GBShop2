//
//  Feedback.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 26.04.2021.
//

import Foundation

struct Feedback: Codable {
    let feedbackID: Int
    let productID: Int
    let text: String
}
