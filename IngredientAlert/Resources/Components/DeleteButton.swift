//
//  DeleteButton.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/8/25.
//

import SwiftUI

struct DeleteButton: View {
    @EnvironmentObject var modelData : ModelData
    var ingredient: Ingredient
    
    var body: some View {
        Text("Delete Button")
    }
}
