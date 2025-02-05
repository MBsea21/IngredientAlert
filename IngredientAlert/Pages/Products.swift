//
//  Products.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Products: View {
    @EnvironmentObject var modelData: ModelData
    @State var productsList: [ProductFE]
    
    var body: some View {
        ProductList(productsList: productsList)
            .environmentObject(modelData)
    }
}

#Preview {
    let modelData = ModelData()
    let productsList = convertBEProductsListToFE(BEProducts: modelData.productListViewModel.productRepository.productsBE, ingredientDict: modelData.ingredientListViewModel.ingredientRepository.ingredientsDict)
    Products(productsList: productsList)
        .environmentObject(ModelData())
}
