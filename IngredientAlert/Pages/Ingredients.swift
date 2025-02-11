//
//  Ingredients.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Ingredients: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText: String = ""
    @State var filteredIngredients: [Ingredient] = []
    @State private var addCommonIngredientisOn : Bool = false
    
    private func textSearchIngredients(textInput: String, ingredientDict: [String: Ingredient])
    -> [Ingredient] {
        var result: [Ingredient] = []
        let lowercasedTextInput = textInput.lowercased()
        let spacesRemovedText = lowercasedTextInput.replacingOccurrences(of: " ", with: "")
        if spacesRemovedText == "" {
            return modelData.ingredientListViewModel.ingredientRepository.ingredients
        }
        for (ingredientName, value) in ingredientDict {
            if ingredientName.contains(spacesRemovedText) {
                result.append(value)
            }
        }
        return result
    }
    var body: some View {
        VStack{
            Section{
                InputView(text:$searchText, title: "Search", placeholder: "Search for ingredients here.....")
                    .autocorrectionDisabled(true)
            }.padding()
            Section {
                if searchText == "" {
                    Section{
                        IngredientList(ingredients: textSearchIngredients(textInput: searchText, ingredientDict: modelData.ingredientListViewModel.ingredientRepository.ingredientsDict))
                    }
                } else {
                    let filteredList = textSearchIngredients(textInput: searchText, ingredientDict: modelData.ingredientListViewModel.ingredientRepository.ingredientsDict)
                    IngredientList(ingredients: filteredList)
                        .environmentObject(modelData)
                    
                }
                    
                    

            }
            
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
