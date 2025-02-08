//
//  IngredientAlertApp.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//

import SwiftUI
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct IngredientAlertApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var modelData = ModelData()
//    @State var ingredientDict: [String: Ingredient] = [:]
//    @State var productsList : [ProductFE] = []
//    private func getIngredientDict (ingredients: [Ingredient]) -> [String: Ingredient] {
//        var ingredientDict: [String: Ingredient] = [:]
//        for ingredient in ingredients {
//            ingredientDict[ingredient.inputName] = ingredient
//        }
//        return ingredientDict
//    }

    var body: some Scene {
//        let ingredientDict = getIngredientDict(ingredients: modelData.ingredientListViewModel.ingredientRepository.ingredients)
//        let productsList = convertBEProductsListToFE(BEProducts: modelData.productListViewModel.productRepository.productsBE, ingredientDict:ingredientDict)
        WindowGroup {
            ContentView(/*ingredientDict: ingredientDict, productsList: productsList*/)
                .environmentObject(modelData)
        }
    }
}
