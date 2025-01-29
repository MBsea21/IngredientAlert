//
//  NavigationMenu.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI
import Foundation

enum Page : String, CaseIterable { // 1
    case Home
    case Products
    case Ingredients
    case Account
    case Help
}

struct TopNavMenu: View {
    @EnvironmentObject var modelData: ModelData
    @State var selectedPage = Page.Home
    
    
    var body: some View {
        Section{
            HStack{
                Text("IngredientAlert")
                    .padding()
                    .foregroundColor(Color.tNav)
                
                Spacer()

                Picker ("Pick a page", selection: $selectedPage) {
                    ForEach(Page.allCases, id: \.self) {item in
                        Text(item.rawValue.capitalized)
                    }
                    .padding()
                }
            }
            .background {
                Color.bTeal.opacity(1.0)
                .ignoresSafeArea()
            }
            Spacer()
        }
        Section {
            if selectedPage.rawValue == "Home" {
                Home()
            }
//            else if selectedPage.rawValue == "Ingredients" {
//                Ingredients()
//                    .environmentObject(ModelData())
//            }
            else if selectedPage.rawValue == "Account" {
                Account()
                    .environmentObject(modelData)
            }
//            else if selectedPage.rawValue == "Products" {
//                Products()
//                    .environmentObject(ModelData())
//            }
            else if selectedPage.rawValue == "Help" {
                Help()
            }
        }
    }
}

#Preview{
    TopNavMenu()
        .environmentObject(ModelData())
}
