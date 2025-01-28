//
//  Allergen.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/23/25.
//

import Foundation
import SwiftUI

struct Allergen: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var associatedIngredientIds: [Int]
}
