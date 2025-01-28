//
//  User.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/23/25.
//

import Foundation
import SwiftUI

struct User: Hashable, Codable, Identifiable {
    var id: Int
    var username: String
    private var password: String
    var name: String
    var email: String
    var isAdmin: Bool
    var personalFlaggedList : [Int]
    var userAllergensIds: [Int]
    
        
    static let `default` = User(id: 0, username: "Anonymous", password: "Anonymous", name: "Anonymous", email: "anonymous", isAdmin: false, personalFlaggedList: [1,3,9], userAllergensIds: [1])
}



