//
//  ContentView.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData : ModelData

    
    var body: some View {
//        do {
//            let ingredientsListRendered = modelData.ingredientListViewModel.ingredientRepository.ingredients
//        }
        
//        if modelData.ingredientListViewModel.ingredientRepository.ingredients != [] {
            TopNavMenu()
                .environmentObject(modelData)
//        }
//        else {
//            Text("Loading...")
//        }
        
    }
}

//#Preview {
//    ContentView(ingredient:)
//        .environmentObject(ModelData())
//}
