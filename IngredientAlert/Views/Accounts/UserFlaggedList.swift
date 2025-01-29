//
//  UserFlaggedList.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/23/25.
//

//import SwiftUI
//
//struct UserFlaggedList: View {
//    @EnvironmentObject var modelData: ModelData
//    var userFlaggedIngredients: [Int]
//    
//    var associatedIngredients: [Ingredient] {
//        modelData.ingredients.filter { (ingredient) -> Bool in
//            return modelData.profile.personalFlaggedList.contains(ingredient)}
//    }
//    
//    var body: some View {
//        ForEach(associatedIngredients) {ingredient in
//            Text(ingredient.commonName)}
//    }
//    
//}
