//
//  ProductIngredientRow.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/22/25.
//

import SwiftUI


struct ProductIngredientRow: View {
    var ingredient: Ingredient
    
    var body: some View {
        
        if ingredient.isFlagged {
            if ingredient.isCommonName {
                Text(ingredient.commonName)
                    .foregroundColor(.red)
            } else {
                Text("\(ingredient.commonName)*")
                    .foregroundColor(.red)
            }
        }else {
            if ingredient.isCommonName {
                Text(ingredient.commonName)
            }
            else {
                Text("\(ingredient.commonName)*")
            }
        }
    }
}


#Preview{
    let ingredients = ModelData().ingredients
    return Group{
        IngredientRow(ingredient: ingredients[0])
    }
}
