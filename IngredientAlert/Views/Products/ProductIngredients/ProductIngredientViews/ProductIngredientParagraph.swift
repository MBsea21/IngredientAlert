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
    var unflaggedIngredients: [Ingredient]
    var unaddedIngredients: [String]
    private func getUnaddedIngredientString (unaddedIngredients: [String]) -> String {
        var unaddedIngredientString = ""
        for ingredient in unaddedIngredients  {
            unaddedIngredientString.append(ingredient + ", ")
        }
        return unaddedIngredientString
    }
    var flagged: AttributedString{
        var result = AttributedString(ingredientParagraphFunction(flaggedIngredients))
            result.foregroundColor = .red
        return result
    }
    var unflagged: AttributedString{
        var result = AttributedString(ingredientParagraphFunction(unflaggedIngredients))
            result.foregroundColor = .gray
        return result
    }
    var unadded: AttributedString {
        var result =
        AttributedString(getUnaddedIngredientString(unaddedIngredients: unaddedIngredients))
        result.foregroundColor = .lightGray
        return result
    }
    
    
    
    var body: some View {
        VStack{
            if flagged != "" && unflagged != "" && unadded != "" {
                Text(flagged + ", " + unflagged + ", " + unadded)
            } else if flagged == "" && unflagged != "" && unadded != ""  {
                Text(unflagged + ", " + unadded)
                
            }else if flagged != "" && unflagged == "" && unadded != "" {
                Text(flagged + ", " + unadded)
            } else if flagged != "" &&
                        unflagged != "" &&
                        unadded == "" {
                Text(flagged + ", " + unflagged)
            } else if flagged == "" && unflagged == ""  && unadded != "" {
                Text(unadded)
            }
//            HStack{
//                let userFlaggedIngredientString = ingredientParagraphFunction(userFlaggedIngredients)
//                Text(userFlaggedIngredientString)
//                    .foregroundColor(.orange)
//                    .accessibilityLabel("User Flagged Ingredients")
//                Spacer()
//            }
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
