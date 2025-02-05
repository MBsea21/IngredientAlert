//
//  Product.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//
import Foundation
import SwiftUI
import FirebaseFirestore

struct ProductFE: Hashable, Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var brand: String
    var use: String
    var useArea: String
    var productIngredients: [Ingredient]
    var flaggedIngredients: [Ingredient]
    var isFlagged: Bool
    var uploaderId: String
    
    
    
}
