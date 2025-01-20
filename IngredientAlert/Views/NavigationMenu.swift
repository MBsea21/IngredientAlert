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
    @Environment(ModelData.self) var modelData
    @State var selectedPage=Page.Home
    
    var body: some View {
        Section{
            HStack{
                Text("IngredientAlert")
                    .padding()
                
                Spacer()

                Picker ("Pick a page", selection: $selectedPage) {
                    ForEach(Page.allCases, id: \.self) {item in
                        Text(item.rawValue.capitalized)
                    }
                    .padding()
                }
            }
            Spacer()
        }
        Section {
            if selectedPage.rawValue == "Home" {
                Home()
            }
            else if selectedPage.rawValue == "Ingredients" {
                IngredientList()
                    .environment(ModelData())
                    }
            else if selectedPage.rawValue == "Account" {
                Account()
            }
            else if selectedPage.rawValue == "Products" {
                Products()
                    .environment(ModelData())
            }
            
            else if selectedPage.rawValue == "LogIn" {
                LogIn()
            }
            else if selectedPage.rawValue == "Help" {
                Help()
            }
        }
    }
}

#Preview{
    TopNavMenu()
        .environment(ModelData())
}
