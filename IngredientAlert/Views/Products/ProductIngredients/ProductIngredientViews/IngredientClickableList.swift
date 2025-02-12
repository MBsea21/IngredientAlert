//
//  IngredientClickableList.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/22/25.
//

import SwiftUI
import Foundation

struct IngredientClickableList: View {
    var flaggedIngredients: [Ingredient]
    var userFlaggedIngredients: [Ingredient]
    var unflaggedIngredients: [Ingredient]
    var unaddedIngredients: [String]
    
    private func getUnaddedIngredientString (unaddedIngredients: [String]) -> String {
        var unaddedIngredientString = ""
        for ingredient in unaddedIngredients  {
            unaddedIngredientString.append(ingredient + ", ")
        }
        return unaddedIngredientString
    }
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                if !userFlaggedIngredients.isEmpty {
                    IngredientGroupLists(ingredientGroupList: userFlaggedIngredients, groupTitle: "UserFlagged Ingredients")
                }
                if !flaggedIngredients.isEmpty {
                    IngredientGroupLists(ingredientGroupList: flaggedIngredients, groupTitle: "Flagged Ingredients")
                }
                if !unflaggedIngredients.isEmpty {
                    IngredientGroupLists(ingredientGroupList: unflaggedIngredients, groupTitle: "UnflaggedIngredients")
                }
                
                if unaddedIngredients != [] {
                    Section{
                        VStack{
                            Text("Unanalyzed Ingredients")
                                .font(.headline)
                            Text(getUnaddedIngredientString (unaddedIngredients: unaddedIngredients))
                                .padding(10)
                            Text("unanalyzed ingredients have not been added to the Ingredient Alert database yet")
                                .font(.footnote)
                                .italic()
                        } .padding(.bottom)
                    }
                }
            }.padding()
            
            Text(" ** common name of ingredient is shown here. Click to see actual ingredient details.")
                .padding()
                .font(.footnote)
            
        }
        .padding()
        .frame(maxWidth:.infinity, maxHeight:600)
        .frame(minHeight: 400)
        .border(.gray)
    
    }

}



