//
//  Ingredients.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Ingredients: View {
    @EnvironmentObject var modelData: ModelData
    @State private var addCommonIngredientisOn : Bool = false
    
    var body: some View {
        Section{
            IngredientList()
                .environmentObject(modelData)
            Spacer()
        }
        
    }
}

        
    


//#Preview {
//    let modelData = ModelData()
//    let ingredients = modelData.ingredientListViewModel.$ingredientViewModels
//    Ingredients(ingredients:binding.constant.ingredients)
//        .environmentObject(modelData)
//}
