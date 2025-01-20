//
//  Products.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Products: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        Text("This is the Products page")
        ProductList()
            .environment(ModelData())
    }
}

#Preview {
    Products()
        .environment(ModelData())
}
