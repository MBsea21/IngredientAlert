//
//  RemovePFlaggedIngredientViews.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/10/25.
//
import SwiftUI

struct RemovePersonalFlaggedIngredientButtons: View {
    @EnvironmentObject var modelData: ModelData
    var ingredient: Ingredient
    @State private var showRemoveFlaggedIngredientAlert: Bool = false
    
    
    var body: some View {
        Button("Remove", role: .destructive) {
                        showRemoveFlaggedIngredientAlert = true
                    }
                    .alert ("Would you like to remove this ignredient from your personal flagged ingredients list?", isPresented: $showRemoveFlaggedIngredientAlert) {
                        Button("Remove all associated names") {
                            Task {
                                await modelData.authViewModel.removeCommonFromFlagged(ingredient)
                                await modelData.authViewModel.fetchUser()
                            }
                        }
                            Button("Remove only this name", role:.destructive) {
                            Task {
                                await modelData.authViewModel.removeSingleInstanceFromFlagged(ingredient)
                                await modelData.authViewModel.fetchUser()
                            }
                        }
                        Button("No", role: .cancel) {}
                        
                    }
        
    }
}
    
