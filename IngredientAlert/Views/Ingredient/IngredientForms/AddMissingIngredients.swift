//
//  AddMissingIngredients.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/5/25.
//

import SwiftUI

struct AddMissingIngredientsForm: View {
    @EnvironmentObject var modelData: ModelData
    var productList: [ProductFE]
    
    
    private func getMissingIngredientsList(productList: [ProductFE]) -> [String] {
        var missingIngredientsList: [String] = []
         for product in productList {
            if product.unaddedIngredients != [] {
                for missingIngredient in product.unaddedIngredients {
                    if !missingIngredientsList.contains(missingIngredient) {
                        missingIngredientsList.append(missingIngredient)
                    }
                }
            }
        }
        return missingIngredientsList
    }
    var body: some View {
        var missingIngredientsList = getMissingIngredientsList(productList: productList)
        Section{
            ForEach(missingIngredientsList, id: \.self) { ingredient in
                MissingWordToggleView(word: ingredient)
                    .environmentObject(modelData)
                
            }
        }
        
    }
}
