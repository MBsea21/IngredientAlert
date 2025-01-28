//
//  AddToListButton.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/23/25.
//

import Foundation
import SwiftUI

struct AddIngredientToListButton: View {
    @Environment(ModelData.self) var modelData
    var ingredient: Ingredient
    
    var ingredientIndex: Int{
        modelData.ingredients.firstIndex(where: {$0.id == ingredient.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData

        DisclosureGroup("Add to personal list") {
                Text("pick list here")
        }
        .navigationTitle(ingredient.inputName)
            .navigationBarTitleDisplayMode(.inline)
        }
}

#Preview {
    let modelData = ModelData()
    return AddIngredientToListButton(ingredient: modelData.ingredients[0])
        .environment(modelData)
}
