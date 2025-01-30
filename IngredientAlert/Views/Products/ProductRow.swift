//
//  ProductRow.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

//import SwiftUI
//
//
//struct ProductRow: View {
//    var product: Product
//    
//    var body: some View {
//        HStack{
//            ProductImageRow(image: product.image)
//            VStack(alignment: .leading){
//                Text(product.brand)
//                    .font(.headline)
//                    .foregroundColor(Color.gray)
//                
//                if product.isFlagged {
//                    Text(product.name)
//                        .foregroundColor(.red)
//                }else {
//                    Text(product.name)
//                }
//            }
//            .padding(10)
//        }
//    }
//}
//
//
//#Preview{
//    let products = ModelData().products
//    return Group{
//        ProductRow(product: products[0])
//    }
//}
