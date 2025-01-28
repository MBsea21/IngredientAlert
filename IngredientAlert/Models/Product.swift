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
    var isFlagged: Bool
    var useTitle: String
    var useArea: String
    var useGroup: String
    var uploaderId: Int

    private var imageName: String
    var image: Image{
        Image(imageName)
    }
    var productIngredientsId: [Int]
}
//}


