//
//  ProductList.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI



struct ProductList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFlaggedOnly = false
    
    
    var filteredProducts: [Product] {
        modelData.products.filter { product in
            (!showFlaggedOnly || product.isFlagged)
        }
    }
    var body: some View {
        NavigationSplitView {
            List{
                Text("Products")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Toggle(isOn: $showFlaggedOnly) {
                    Text("Show Flagged Products")
                }
                ForEach(filteredProducts) {product in
                    NavigationLink {
                        ProductDetail(product: product)
                    } label: {
                        ProductRow(product: product)
                    }
                    
                }
            }
            .animation(.default, value:filteredProducts)
            
        } detail: {
            Text("Select a Product")
            
        }
        .navigationTitle("Products")
    }
        
}

#Preview {
    ProductList()
        .environmentObject(ModelData())
}
