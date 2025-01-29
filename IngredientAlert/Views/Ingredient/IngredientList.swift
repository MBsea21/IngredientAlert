
//
//  IngredientList.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//

import SwiftUI



struct IngredientList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showCommonNameOnly = true
    @State private var showFlaggedOnly = false
    
    
    var filteredIngredients: [Ingredient] {
        modelData.ingredients.filter { ingredient in
            (!showCommonNameOnly || ingredient.isCommonName)
        }
    }
    var body: some View {        
        NavigationSplitView {
            List{
                Text("Ingredients")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Toggle(isOn: $showCommonNameOnly) {
                    Text("Common Name Only")
                }
                ForEach(filteredIngredients) {ingredient in
                    NavigationLink {
                        IngredientDetail(ingredient: ingredient)
                    } label: {
                        IngredientRow(ingredient: ingredient)
                    }
                    
                }
            }
            .animation(.default, value:filteredIngredients)
            
        } detail: {
            Text("Select an Ingredient")
            
        }
        .navigationTitle("Ingredients")
    }
        
}

#Preview {
    IngredientList()
        .environmentObject(ModelData())
}
