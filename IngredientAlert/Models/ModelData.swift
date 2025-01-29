//
//  ModelData.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//
//import Foundation
//
//@Observable
//class ModelData {
//    var ingredients: [Ingredient] = load("oneIngredientData.json")
//}
//
//func load<T: Decodable>(_ filename: String) -> T {
//
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
//    }
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//
//    }
//}
import Foundation

class ModelData: ObservableObject{
    var ingredients: [Ingredient] = load("oneIngredientData.json")
    var products: [Product] = load("Products.json")
    var allergens: [Allergen] = load("Allergens.json")
    var profile: User = User.default
    var authViewModel: AuthViewModel = createViewModel()
}


func createViewModel() -> AuthViewModel {
    let authViewModel = AuthViewModel()
        return authViewModel
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


//func loadProfileFromDatabase() async -> User {
//}


//func loadProductsFromDatabase() -> [Product] {
//
//}
//
//func loadAllergensFromDatabase() -> [Allergen] {
//
//}
//
//func loadIngredientsFromDatabase() -> [Ingredient] {
//
//}
//
//
