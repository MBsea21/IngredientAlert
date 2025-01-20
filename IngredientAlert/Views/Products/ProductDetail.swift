//
//  ProductDetail.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import Foundation
import SwiftUI
import SwiftData

struct ProductDetail: View {
    @Environment(ModelData.self) var modelData
    var product: Product
    
    var productIndex: Int{
        modelData.products.firstIndex(where: {$0.id == product.id })!
    }
    
    
    var body: some View {
//        @Bindable var modelData = modelData
        Text(product.brand)
        
        Text(product.name)
        
        if product.isFlagged {
            Text("This product has been flagged for containing skin irritating ingredients!")
                .padding()
                .foregroundColor(.red)
        }
        ProductImage(image: product.image)
    }
    
}


    
#Preview {
    let modelData = ModelData()
    return ProductDetail(product: modelData.products[0])
        .environment(modelData)
}
