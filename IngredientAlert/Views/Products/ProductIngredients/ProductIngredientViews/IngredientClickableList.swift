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
    
    var body: some View {
        ScrollView(.vertical){
            Text("User Flagged Ingredients")
                .font(.headline)
                .padding(.top)
            ScrollView(.horizontal){
                HStack(spacing: 20){
                    Spacer()
                    ForEach(userFlaggedIngredients) { ingredient in
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
                    Spacer()
                }.fixedSize(horizontal: true, vertical: true)
                    .padding(.bottom)
            }
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
                    Spacer()
                }.fixedSize(horizontal: true, vertical: true)
                    .padding(.bottom)
            }
            
            
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
                    Spacer()
                }.fixedSize(horizontal: true, vertical: false)
            }
            
            Text(" * common name of ingredient is shown here. Click to see actual ingredient details.")
                .padding()
                .font(.footnote)
        }
        .frame(maxWidth:.infinity, maxHeight:300)
        .border(.gray)
    }    
}



#Preview {
    let modelData = ModelData()
    let flaggedIngredients = [modelData.ingredients[0]]
    let unflaggedIngredients = [modelData.ingredients[9]]
    let userflaggedIngredients = [modelData.ingredients[8]]
    IngredientClickableList(flaggedIngredients: flaggedIngredients, userFlaggedIngredients: userflaggedIngredients, unflaggedIngredients: unflaggedIngredients)
}
