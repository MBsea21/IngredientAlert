//
//  Products.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct AddProduct: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        AddProductForm()
            .environmentObject(modelData)
        Text("Add Product")
//        ProductList()
//            .environmentObject(modelData)
    }
}

#Preview {
    AddProduct()
        .environmentObject(ModelData())
}
