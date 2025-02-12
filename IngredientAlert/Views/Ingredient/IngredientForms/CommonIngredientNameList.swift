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
        let filteredIngredients = getIngredientsWithoutOtherNames(commonNameIngredients: commonNameIngredients)
        
        NavigationSplitView {
            List{
                Text("Common Name Ingredients")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                ForEach(filteredIngredients) {ingredient in
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
        //
    }
    private func getIngredientsWithoutOtherNames (commonNameIngredients: [Ingredient]) -> [Ingredient]{
        var filteredList: [Ingredient] = []
        for ingredient in commonNameIngredients {
            let otherNames = getOtherNames(currentIngredient: ingredient,
                                           ingredients:modelData.ingredientListViewModel.ingredientRepository.ingredients)
            if otherNames.isEmpty{
                filteredList.append(ingredient)
            }
        }
    return filteredList
    }
   
}
    

        

#Preview {
    let modelData = ModelData()
    IngredientList(ingredients:modelData.ingredientListViewModel.ingredientRepository.ingredients)
        .environmentObject(modelData)
}
