////
////  ProductIngredientParagraph.swift
////  IngredientAlert
////
////  Created by Madeline Bennett on 1/22/25.
////
//
import SwiftUI
import Foundation

struct ProductIngredientParagraph: View {
    var flaggedIngredients: [Ingredient]
//    var userFlaggedIngredients: [Ingredient]
    var productIngredients: [Ingredient]
    
    
    
    
    var body: some View {
        VStack{
//            HStack{
//                let userFlaggedIngredientString = ingredientParagraphFunction(userFlaggedIngredients)
//                Text(userFlaggedIngredientString)
//                    .foregroundColor(.orange)
//                    .accessibilityLabel("User Flagged Ingredients")
//                Spacer()
//            }
            HStack{
                let flaggedIngredientString = ingredientParagraphFunction(flaggedIngredients)
                Text(flaggedIngredientString)
                    .foregroundColor(.red)
                    .accessibilityLabel("Flagged Ingredients")
                Spacer()
            }
            HStack {
                let productIngredientString = ingredientParagraphFunction(productIngredients)
                Text(productIngredientString)
                Spacer()
            }

        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
    }
}
    

//#Preview {
//    let modelData = ModelData()
//    let flaggedIngredients = [modelData.ingredients[0]]
//    let unflaggedIngredients = [modelData.ingredients[5]]
//    let userflaggedIngredients = [modelData.ingredients[1]]
//    ProductIngredientParagraph(flaggedIngredients: flaggedIngredients, userFlaggedIngredients: userflaggedIngredients, unflaggedIngredients: unflaggedIngredients)
//}
