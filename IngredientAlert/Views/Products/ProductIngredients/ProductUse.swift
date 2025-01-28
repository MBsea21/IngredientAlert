//
//  ProductUse.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/23/25.
//
import SwiftUI

struct ProductUse: View {
    @Environment(ModelData.self) var modelData
    var product: Product
    
    var body: some View {
        Section {
            VStack{
                Text("Use")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Divider()
                Text("\(product.useTitle)")
                Text("Area : \(product.useArea)")
                Text("Group : \(product.useGroup)" )
            }
        }
        .frame(maxWidth:.infinity)
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .background {
            Color.bWhite2.opacity(0.25)
        
        }
        
    }
}



#Preview {
    let modelData = ModelData()
    ProductUse(product: modelData.products[0])
        .environment(ModelData())
}
