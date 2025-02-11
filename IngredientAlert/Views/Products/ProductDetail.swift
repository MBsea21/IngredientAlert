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
                
                Text("Brand | \(product.brand)")
                    .font(.subheadline)
                Text("Use | \(product.use)")
                    .font(.subheadline)
                Text("Use Area | \(product.useArea)")
                    .font(.subheadline)
                
                
                
            }.multilineTextAlignment(.center)
        }
        if product.isFlagged {
            if !product.userFlaggedIngredients.isEmpty {
                Text("This product has been flagged for containing skin irritating ingredients!")
                    .padding(.bottom)
                    .foregroundColor(.red)
            } else {
                Text("This product contains both personal and IngredientAlert flagged ingredients!")
                    .padding(.bottom)
                    .foregroundColor(.red)
            }
        }else if !product.userFlaggedIngredients.isEmpty {
            Text("This product contains personal flagged Ingredients")
                .padding(.bottom)
                .foregroundColor(.pink)
        }
        Divider()
        Section {
            ProductIngredientsList(product: product)
                .environmentObject(modelData)
        }
        Divider()
        Spacer()
    }
        
//
}
    






    
//#Preview {
//    let modelData = ModelData()
//    return ProductDetail(product: modelData.products[0])
//        .environmentObject(modelData)
//}
