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
    case AddProduct
    case Products
    case Ingredients
    case Admin
    case Account
    case Help
}

struct TopNavMenu: View {
    @EnvironmentObject var modelData: ModelData
    @State var selectedPage = Page.Home
    @State var ingredientDict: [String: Ingredient] = [:]
    @State var productsList : [ProductFE] = []

//
    var body: some View {
        let ingredientDict = modelData.ingredientListViewModel.ingredientRepository.ingredientsDict
        let productsList = convertBEProductsListToFE(BEProducts: modelData.productListViewModel.productRepository.productsBE, ingredientDict:ingredientDict)
        
        
        Section{
            HStack{
                Text("IngredientAlert")
                    .padding()
                    .foregroundColor(Color.tNav)
                
                Spacer()
                
                Picker ("Pick a page", selection: $selectedPage) {
                    ForEach(Page.allCases, id: \.self) {item in
                        if item.rawValue == "AddProduct" {
                            Text("Add Product")
                        } else {
                            Text(item.rawValue.capitalized)
                        }
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
        Section{
            if selectedPage.rawValue == "Home" {
                Home(productsList: productsList)
                    .environmentObject(modelData)
            }
            else if selectedPage.rawValue == "Ingredients" {
                Ingredients()
                    .environmentObject(modelData)
            }
            else if selectedPage.rawValue == "Account" {
                let loggedIn = modelData.authViewModel.userSession != nil
                Account(isLoggedIn: loggedIn)
                    .environmentObject(modelData)
            }
            else if selectedPage.rawValue == "Admin" {
                Admin(productList: productsList)
                    .environmentObject(modelData)
            }
            else if selectedPage.rawValue == "AddProduct" {
                AddProduct()
                    .environmentObject(modelData)
            }
            else if selectedPage.rawValue == "Products" {
                Products(productsList: productsList)
                    .environmentObject(modelData)
            }
            else if selectedPage.rawValue == "Help" {
                Help()
            }
        }
    }
}

//#Preview{
//    TopNavMenu()
//        .environmentObject(ModelData())
//}
