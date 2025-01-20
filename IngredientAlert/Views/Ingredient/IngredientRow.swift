//
//  IngredientRow.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//

import SwiftUI


struct IngredientRow: View {
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


#Preview{
    let ingredients = ModelData().ingredients
    return Group{
        IngredientRow(ingredient: ingredients[0])
    }
}
