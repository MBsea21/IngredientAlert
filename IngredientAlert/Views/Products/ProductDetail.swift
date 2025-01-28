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
        Divider()
        @Bindable var modelData = modelData
        @State  var showProductIngredientDetails:Bool = false
        HStack{
            Section{
                ProductImage(image: product.image)
            }
            VStack{
                Text(product.name)
                    .font(.title2)
                    .padding(.bottom)
                    .fixedSize(horizontal: false, vertical: false)
                    .frame(width:200)
                    
                Text(product.brand)
                    .font(.subheadline)
                    
                    
            }.multilineTextAlignment(.center)
        }
        
        if product.isFlagged {
            Text("This product has been flagged for containing skin irritating ingredients!")
                .padding(.bottom)
                .foregroundColor(.red)
        }
        Divider()
        Section {
            ProductUse(product: product)
                .environment(modelData)
            
            Divider()
            Section {
                ProductIngredientsList(product: product)
                    .environment(modelData)
            }
            Divider()
        }
        Spacer()
    }
    
    
    
}
    






    
#Preview {
    let modelData = ModelData()
    return ProductDetail(product: modelData.products[0])
        .environment(modelData)
}
