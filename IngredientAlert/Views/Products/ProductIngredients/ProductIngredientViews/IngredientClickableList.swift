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
     
    var body: some View {
        ScrollView(.vertical){
            Section{
                if flaggedIngredients != [] {
                    Section {
                        Text("Flagged Ingredients")
                            .font(.headline)
                            .padding(.top)
                        ScrollView(.horizontal){
                            HStack(spacing: 20){
                                Spacer()
                                ForEach(flaggedIngredients) { ingredient in
                                    NavigationLink {
                                        ProductIngredientDetail(ingredient: ingredient)
                                    } label: {
                                        ProductIngredientRow(ingredient: ingredient)
                                            .padding(10)
                                            .border(.gray)
                                            .cornerRadius(3)
                                            .shadow(radius: 3)
                                            .background {
                                                Color.bWhite2.opacity(0.15)
                                            }
                                    }
                                }
                            }.fixedSize(horizontal: true, vertical: true)
                                .padding(.bottom)
                        }
                    }
                    if unflaggedIngredients != [] {
                        Section {
                            Text("Unflagged Ingredients")
                                .font(.headline)
                            ScrollView (.horizontal, showsIndicators:true) {
                                HStack(spacing: 20){
                                    Spacer()
                                    ForEach(unflaggedIngredients) { ingredient in
                                        NavigationLink {
                                            IngredientDetail(ingredient: ingredient)
                                        } label: {
                                            IngredientRow(ingredient: ingredient)
                                                .padding(10)
                                                .border(.gray)
                                                .cornerRadius(3)
                                                .shadow(radius: 3)
                                                .background {
                                                    Color.bWhite2.opacity(0.15)
                                                }
                                        }
                                    }.padding(.bottom)
                                }.fixedSize(horizontal: true, vertical: true)
                                    .padding(.bottom)
                            }
                        }
                    }
                    if unaddedIngredients != [] {
                        Section{
                            VStack{
                                Text("UnAnalyzed Ingredients")
                                    .font(.headline)
                                Text(getUnaddedIngredientString (unaddedIngredients: unaddedIngredients))
                                    .padding(10)
                                Text(" * unanalyzed ingredients have not been added to the Ingredient Alert database yet")
                            } .padding(.bottom)
                            
                        }
                    }
                }
                Text(" * common name of ingredient is shown here. Click to see actual ingredient details.")
                    .padding()
                    .font(.footnote)
            }
            .padding()
            
            
        }
        .frame(maxWidth:.infinity, maxHeight:300)
        .border(.gray)
    
    }

}


//#Preview {
//    let modelData = ModelData()
//    let flaggedIngredients = [modelData.ingredients[0]]
//    let unflaggedIngredients = [modelData.ingredients[9]]
////    let userflaggedIngredients = [modelData.ingredients[8]]
//    IngredientClickableList(flaggedIngredients: flaggedIngredients, /*userFlaggedIngredients: userflaggedIngredients,*/ unflaggedIngredients: unflaggedIngredients)
//}
