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
        if modelData.dataLoaded == true {
            TopNavMenu()
                .environmentObject(modelData)
        } else {
            Text("Loading Data......")
        }
//        else {
//            Text("Loading...")
//        }
        
    }
}

//#Preview {
//    ContentView(ingredient:)
//        .environmentObject(ModelData())
//}
