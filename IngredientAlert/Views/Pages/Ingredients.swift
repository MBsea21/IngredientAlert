//
//  Ingredients.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Ingredients: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        Text("This is the Ingredients page")
        IngredientList()
            .environment(ModelData())
    }
}

#Preview {
    Ingredients()
}
