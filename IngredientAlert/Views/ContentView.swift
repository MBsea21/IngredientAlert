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
        TopNavMenu()
            .environmentObject(modelData)
    }
}

#Preview {
    ContentView()
        .environmentObject(ModelData())
}
