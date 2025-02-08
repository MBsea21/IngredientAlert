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
import SwiftUI

@MainActor
class ModelData: ObservableObject {
    @Published var authViewModel: AuthViewModel
    @Published var ingredientListViewModel: IngredientListViewModel
    @Published var productListViewModel: ProductListViewModel
    
    init() {
        authViewModel = createViewModel()
        let ingredientListViewModel = createIngredientListViewModel()
        self.ingredientListViewModel = ingredientListViewModel
        let productListViewModel = createProductListViewModel()
        self.productListViewModel = productListViewModel
        NotificationCenter.default.addObserver(self, selector: #selector(self.ingredientsProductsLoadedHandler(notification:)), name: NSNotification.Name("ingredientAlert.productsLoaded"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.ingredientsProductsLoadedHandler(notification:)), name: NSNotification.Name("ingredientAlert.ingredientsLoaded"), object: nil)
    }
    
    @objc func ingredientsProductsLoadedHandler(notification: NSNotification) {
        print("handler called")
        
        if (!self.ingredientListViewModel.ingredientRepository.ingredients.isEmpty &&
            !self.productListViewModel.productRepository.productsBE.isEmpty) {
            print("all data loaded!")
            print("ingredientsCount: ", self.ingredientListViewModel.ingredientRepository.ingredients.count)
            print("productsCount: ", self.productListViewModel.productRepository.productsBE.count)
//            self.productListViewModel.productRepository.productsFE.append(<#T##newElement: ProductFE##ProductFE#>)

        } else {
            print("data still missing")
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("ingredientAlert.productsLoaded"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("ingredientAlert.ingredientsLoaded"), object: nil)
    }
}

func createViewModel() -> AuthViewModel {
    let authViewModel = AuthViewModel()
        return authViewModel
}

func createIngredientListViewModel () -> IngredientListViewModel {
    let ingredientListViewModel = IngredientListViewModel()
    return ingredientListViewModel
}

func createProductListViewModel () -> ProductListViewModel {
    let productListViewModel = ProductListViewModel()
    return productListViewModel
}

func createProductsViewViewModel (productsRepository: Published<ProductRepository>.Publisher, ingredientsRepository: Published<IngredientRepository>.Publisher) -> ProductsViewViewModel {
    let productListViewModel = ProductsViewViewModel(productsRepository: productsRepository, ingredientsRepository: ingredientsRepository)
    return productListViewModel
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
