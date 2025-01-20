//
//  Product.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import Foundation
import SwiftUI

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var brand: String
//    var productIngredients: [String]
//    var ingredients: String
    var isFlagged: Bool
//    var use: String
//    var useArea: String
//    var useGroup: String
//    var productLink: String
//    var uploaderId: Int
//    var imageName: String

    private var imageName: String
    var image: Image{
        Image(imageName)
    }


}
//}
