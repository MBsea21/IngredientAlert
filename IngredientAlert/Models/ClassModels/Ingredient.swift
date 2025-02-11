//
//  Ingredient.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//
import Foundation
import SwiftUI
import FirebaseFirestore

struct Ingredient: Hashable, Codable, Identifiable {
    @DocumentID var id: String?
    var inputName: String
    var commonName: String
    var isCommonName: Bool
    var commonNameId: String?
    var isFlagged: Bool
    var sourceUrl: String
    var pubChemUrl: String


    
}
