//
//  Products.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Products: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        Text("PRODUCTS PAGE")
//        ProductList()
//            .environmentObject(modelData)
    }
}

#Preview {
    Products()
        .environmentObject(ModelData())
}
