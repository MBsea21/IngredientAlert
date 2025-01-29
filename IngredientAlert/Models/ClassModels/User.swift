//
//  User.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/23/25.
//

import Foundation
import SwiftUI

struct User: Hashable, Codable, Identifiable {
    var id: String
    var fullname: String
    var email: String
    var isAdmin: Bool?
//    var personalFlaggedList : [Ingredient]
//    var userAllergens: [Ingredient]

        
    static let `default` = User(id:NSUUID().uuidString , fullname: "Anonymous", email: "anonymous", isAdmin: false/*, personalFlaggedList: [], userAllergens: []*/)
}



