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
    @State private var showingDeleteAlert: Bool = false
    @State private var isLoading: Bool = false


    var body: some View {
        ScrollView{
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
            Section{
                if product.isFlagged {
                    if !product.userFlaggedIngredients.isEmpty {
                        Text("This product has been flagged for containing skin irritating ingredients!")
                            .padding()
                            .frame(width: 400)
                            .foregroundColor(.red)
                    } else {
                        Text("This product contains both personal and IngredientAlert flagged ingredients!")
                            .padding()
                            .frame(width: 400)
                            .foregroundColor(.red)
                    }
                }else if !product.userFlaggedIngredients.isEmpty {
                    Text("This product contains personal flagged Ingredients")
                        .padding()
                        .frame(width: 400)
                        .foregroundColor(.pink)
                }
            } .fixedSize(horizontal: false, vertical: true)
            Divider()
            Section {
                ProductIngredientsList(product: product)
                    .environmentObject(modelData)
            }
            if modelData.authViewModel.currentUser != nil {
                VStack{
                    if modelData.authViewModel.currentUser!.isAdmin == true {
                        Button("Delete Product") {
                            showingDeleteAlert = true
                        }
                        .alert("Are you sure you want to delete this item?", isPresented: $showingDeleteAlert) {
                            Button("Yes", role: .destructive) {
                                Task{
                                    
                                    await handleProductDeletion()
                                    
                                    modelData.productListViewModel.productRepository.get()
                                    
                                    ProductList(productsList: modelData.productListViewModel.productRepository.productsFE)
                                        .environmentObject(modelData)
                                }
                            }
                            Button("No", role: .cancel) {}
                            
                        }
                    }
                    Divider()
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
     
    private func handleProductDeletion () async {
        modelData.productListViewModel.productRepository.remove(product)
    }

}
    






    
//#Preview {
//    let modelData = ModelData()
//    return ProductDetail(product: modelData.products[0])
//        .environmentObject(modelData)
//}
