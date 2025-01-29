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
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    static let `default` = User(id:NSUUID().uuidString , fullname: "Anonymous", email: "anonymous", isAdmin: false/*, personalFlaggedList: [], userAllergens: []*/)
}



