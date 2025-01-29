//
//  AccountInfo.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/20/25.
//

import SwiftUI
import Foundation

struct AccountInfo: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        Section{
            Text("Welcome back \(modelData.profile.fullname)!")
                .font(.title)
        }
    
            
        Section{
            DisclosureGroup("Email") {
                Text( modelData.profile.email)
            }
//            DisclosureGroup("Allergens") {
//                if modelData.profile.userAllergens == [] {
//                    Text("No Allergens Listed")
//                } else {
////                    UserAllergenList(allergenIds: modelData.profile.userAllergensIds)
////                        .environmentObject(ModelData())
//                }
            
            DisclosureGroup("Personal Flagged Ingredients") {
//                if modelData.profile.personalFlaggedList == [] {
//                    Text("No ingredients added yet")
//                } else {
//                    Text("Flagged Ingredients")
////                    UserFlaggedList(userFlaggedIngredients: modelData.profile.personalFlaggedList)
//                }
            }
            
        }.padding(30)
                
        Spacer()
    }
}

#Preview {
    Account()
        .environmentObject(ModelData())
}
