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
    var unflaggedIngredients: [Ingredient]
    var userFlaggedIngredients: [Ingredient]
    var unaddedIngredients: [String]
    private func getUnaddedIngredientString (unaddedIngredients: [String]) -> String {
        var unaddedIngredientString = ""
        for ingredient in unaddedIngredients  {
            unaddedIngredientString.append(ingredient + ", ")
        }
        return unaddedIngredientString
    }
    var userFlagged: AttributedString {
        var result = AttributedString(ingredientParagraphFunction(userFlaggedIngredients))
        result.foregroundColor = .orange
        return result
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
            if userFlagged != "" && flagged != "" && unflagged != "" && unadded != "" {
                Text(userFlagged + ", " + flagged + ", " + unflagged + ", " + unadded)
                
            } else if userFlagged != "" && flagged == "" && unflagged != "" && unadded != ""  {
                Text(userFlagged + ", " + unflagged + ", " + unadded)
                
            }else if userFlagged != "" && flagged != "" && unflagged == "" && unadded != "" {
                Text(userFlagged + ", " + flagged + ", " + unadded)
                
            } else if userFlagged != "" && flagged != "" &&
                        unflagged != "" &&
                        unadded == "" {
                Text(userFlagged + ", " + flagged + ", " + unflagged)
                
            } else if userFlagged != "" && flagged == "" && unflagged == ""  && unadded != "" {
                Text(userFlagged + ", " + unadded)
                
            } else if userFlagged == "" && flagged != "" && unflagged != "" && unadded != "" {
                Text(flagged + ", " + unflagged + ", " + unadded)
                
                
            } else if userFlagged == "" && flagged == "" && unflagged != "" && unadded != ""  {
                Text(unflagged + ", " + unadded)
                
            }else if userFlagged == "" && flagged != "" && unflagged == "" && unadded != "" {
                Text( flagged + ", " + unadded)
                
            } else if userFlagged == "" && flagged != "" &&
                        unflagged != "" &&
                        unadded == "" {
                Text( flagged + ", " + unflagged)
                
            } else if userFlagged == "" && flagged == "" && unflagged == ""  && unadded != "" {
                Text(unadded)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
    }
}
    

