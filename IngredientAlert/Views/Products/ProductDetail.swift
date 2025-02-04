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
    @EnvironmentObject var modelData: ModelData
    var product: ProductFE
//    var productIndex: Int{
//        modelData.products.firstIndex(where: {$0.id == product.id })!
//    }
//

    var body: some View {
        Divider()
        @ObservedObject var modelData = modelData
        @State  var showProductIngredientDetails:Bool = false
        HStack{
            //            Section{
            //                ProductImage(image: product.image)
            //            }
            VStack{
                Text(product.name)
                    .font(.title2)
                    .padding(.bottom)
                    .fixedSize(horizontal: false, vertical: false)
                    .frame(width:200)
                
                Text(product.brand)
                    .font(.subheadline)
                Text(product.use)
                    .font(.subheadline)
                Text(product.useArea)
                    .font(.subheadline)
                
                
            }.multilineTextAlignment(.center)
        }
        
        if product.isFlagged! {
            Text("This product has been flagged for containing skin irritating ingredients!")
                .padding(.bottom)
                .foregroundColor(.red)
        }
        Divider()
        //            Divider()
        //            Section {
        
        //                ProductIngredientsList(product: product)
        //                    .environmentObject(modelData)
        //            }
        //            Divider()
        Spacer()
    }
        
//
}
    






    
//#Preview {
//    let modelData = ModelData()
//    return ProductDetail(product: modelData.products[0])
//        .environmentObject(modelData)
//}
