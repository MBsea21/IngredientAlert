//
//  AccountInfo.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/20/25.
//

import SwiftUI
import Foundation

struct AccountInfo: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        Section{
            Text("Welcome back \(modelData.profile.name)!")
                .font(.title)
        }
    
            
        Section{
            DisclosureGroup("Username") {
                Text(modelData.profile.username)
            }
            DisclosureGroup("Email") {
                Text( modelData.profile.email)
            }
            DisclosureGroup("Allergens") {
                if modelData.profile.userAllergensIds == [0] {
                    Text("No Allergens Listed")
                } else {
                    UserAllergenList(allergenIds: modelData.profile.userAllergensIds)
                        .environment(ModelData())
                }
            }
            DisclosureGroup("Personal Flagged Ingredients") {
                if modelData.profile.personalFlaggedList == [0] {
                    Text("No ingredients added yet")
                } else {
                    UserFlaggedList(userFlaggedIngredients: modelData.profile.personalFlaggedList)
                }
            }
            
        }.padding(30)
                
        Spacer()
    }
}

#Preview {
    Account()
        .environment(ModelData())
}
