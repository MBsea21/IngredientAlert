//
//  Ingredient.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//
import Foundation
import SwiftUI

struct Ingredient: Hashable, Codable, Identifiable {
    var id: Int
    var inputName: String
    var commonName: String
    var isCommonName: Bool
    var commonNameId: Int
    var isFlagged: Bool
    var sourceUrl: String
    var pubChemUrl: String
    var otherNames: String
}
