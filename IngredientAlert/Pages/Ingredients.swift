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
        IngredientList()
            .environmentObject(modelData)
    }
}

#Preview {
    Ingredients()
}
