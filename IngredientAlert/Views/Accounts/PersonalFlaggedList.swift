//
//  PersonalFlaggedList.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/10/25.
//
import SwiftUI

struct PersonalFlaggedList: View {
    @EnvironmentObject var modelData: ModelData
    var flaggedList: [Ingredient]
    
    var body: some View {
        ScrollView{
            ForEach(flaggedList) {ingredient in
                HStack {
                    Text(ingredient.inputName)
                    RemovePersonalFlaggedIngredientButtons(ingredient:ingredient)
                        .environmentObject(modelData)
                }
            }
        }
    }
}
