//
//  ContentView.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TopNavMenu()
            .environment(ModelData())
        }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
