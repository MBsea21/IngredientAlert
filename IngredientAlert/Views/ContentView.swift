//
//  ContentView.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData : ModelData

    
    var body: some View {
        if modelData.dataLoaded == true {
            if modelData.authViewModel.userSession != nil {
                
                if modelData.authViewModel.currentUser?.isAdmin == true {
                    AdminTopNavMenu()
                        .environmentObject(modelData)
                }
                else {
                    TopNavMenu()
                        .environmentObject(modelData)
                }
            } else {
                Account(isLoggedIn: false)
                    .environmentObject(modelData)
            }
            
        } else {
            Image(.iconLogoSquare)
                .resizable()
                .frame(width: 300, height: 300)
            
                
            Text("Loading Data......")
        }

        
    }
}

//#Preview {
//    ContentView(ingredient:)
//        .environmentObject(ModelData())
//}
