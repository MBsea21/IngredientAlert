//
//  Ingredients.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Ingredients: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        let currentUser = modelData.authViewModel.currentUser
        if currentUser?.isAdmin == true {
            VStack {
                NavigationStack{
                    
                
                NavigationLink {
                    AddCommonIngredientForm()
                        .environmentObject(modelData)
                } label: {
                    Label("Add Common Ingredient", systemImage:  "plus.diamond.fill")
                    
                }
            }
        }
            
        } else {
                Text("Ingredients List")
            
            
        }
    }
}

#Preview {
    Ingredients()
        .environmentObject(ModelData())
}
