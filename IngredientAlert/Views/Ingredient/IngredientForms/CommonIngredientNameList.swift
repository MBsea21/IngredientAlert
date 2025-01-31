//
//  CommonIngredientNameList.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

import SwiftUI



struct CommonIngredientNameList: View {
    @EnvironmentObject var modelData: ModelData
    

    
    var body: some View {
        let ingredients = modelData.ingredientListViewModel.ingredientRepository.ingredients
        var commonNameIngredients: [Ingredient] {
            ingredients.filter { (ingredient) -> Bool in
                return ingredient.isCommonName == true }
        }
        NavigationSplitView {
            List{
                Text("Common Name Ingredients")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                ForEach(commonNameIngredients) {ingredient in
                    NavigationLink {
                        AddOtherIngredientNamesForm(ingredient: ingredient)
                            .environmentObject(modelData)
                    } label: {
                        IngredientRow(ingredient: ingredient)
                    }
                    
                }
            }
            .animation(.default, value:commonNameIngredients)
            
        } detail: {
            Text("Select an Ingredient")
            
        }
        .navigationTitle("Ingredients")
        
//        let currentUserAdminStatus = modelData.authViewModel.currentUser?.isAdmin
//        if currentUserAdminStatus  == true {
//            AdminAddIngredientNav()
//                .environmentObject(modelData)
//        }
    }
    
}
        

#Preview {
    let modelData = ModelData()
    IngredientList()
        .environmentObject(modelData)
}
