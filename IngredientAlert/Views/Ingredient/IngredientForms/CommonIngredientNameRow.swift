//
//  CommonIngredientNameRow.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

import SwiftUI


import SwiftUI


struct CommonIngredientNameRow: View {
    var ingredient: Ingredient
    
    var body: some View {
        
        if ingredient.isFlagged {
            Text(ingredient.inputName)
                .foregroundColor(.red)
        }else {
            Text(ingredient.inputName)
        }
    }
}
