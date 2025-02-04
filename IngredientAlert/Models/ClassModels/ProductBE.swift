//
//  ProductBE.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/3/25.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct ProductBE: Hashable, Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var brand: String
    var use: String
    var useArea: String
    var inputProductIngredients: [String]
    var uploaderId: String
    
    
}
