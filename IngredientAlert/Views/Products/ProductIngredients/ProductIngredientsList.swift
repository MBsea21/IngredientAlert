//
//  ProductIngredientsList.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/21/25.
//

//import SwiftUI
//import Foundation
//
//struct ProductIngredientsList: View {
//    @EnvironmentObject var modelData: ModelData
//    @State var showIngredientDetails : Bool = false
//    
//    var product : Product
//    
//    var productIngredients: [Ingredient] {
//        modelData.ingredients.filter { (ingredient) -> Bool in
//            return product.productIngredientsId.contains(ingredient.documentID)}
//    }
//    
//    
//    var flaggedIngredients: [Ingredient] {
//        productIngredients.filter { (ingredient) -> Bool in
//            return ingredient.isFlagged == true}
//    }
//    
//    //    var userFlaggedIngredients: [Ingredient] {
//    //        productIngredients.filter{ (ingredient) -> Bool in
//    //            return modelData.profile.personalFlaggedList.contains(ingredient.id)}
//    //    }
//    var unflaggedIngredients: [Ingredient] {
//        productIngredients.filter { (ingredient) -> Bool in
//            return ingredient.isFlagged == false}
//    }
//    
//    
//    
//    var body: some View {
//        Section {
//            HStack {
//                Text("Ingredients")
//                    .font(.title3)
//                    .scaledToFill()
//                    .padding()
//                    .accessibilityLabel("Product Ingredients Menu")
//                
//                Spacer()
//                VStack{
//                    Section{
//                        Text("Details")
//                            .scaledToFill()
//                            .frame(width : 60, height:15)
//                        
//                        Toggle("Show Details", isOn:$showIngredientDetails)
//                            .frame(width: 100)
//                            .font(.callout)
//                            .labelsHidden()
//                    }
//                }
//            }
//            
//            if showIngredientDetails {
//                IngredientClickableList(flaggedIngredients: flaggedIngredients, /*userFlaggedIngredients: userFlaggedIngredients,*/ unflaggedIngredients: unflaggedIngredients)
//                
//            } else {
////                ProductIngredientParagraph(flaggedIngredients: flaggedIngredients,  /*userFlaggedIngredients: userFlaggedIngredients,*/ unflaggedIngredients: unflaggedIngredients)
//            }
//        }
//    }
//    
//    
//}
//                
//        
//    
//    
//
//#Preview {
//    let modelData = ModelData()
//    return ProductIngredientsList(product: modelData.products[0])
//        .environmentObject(modelData)
//}
//
