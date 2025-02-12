//
//  ModelData.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//
import Foundation
import SwiftUI

@MainActor
class ModelData: ObservableObject {
    @Published var authViewModel: AuthViewModel
    @Published var ingredientListViewModel: IngredientListViewModel
    @Published var productListViewModel: ProductListViewModel
    @Published var dataLoaded: Bool = false
    
    
    init() {
        authViewModel = createViewModel()
        let ingredientListViewModel = createIngredientListViewModel()
        self.ingredientListViewModel = ingredientListViewModel
        let productListViewModel = createProductListViewModel()
        self.productListViewModel = productListViewModel
        NotificationCenter.default.addObserver(self, selector: #selector(self.ingredientsProductsLoadedHandler(notification:)), name:
            NSNotification.Name("ingredientAlert.userDataLoaded"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.ingredientsProductsLoadedHandler(notification:)), name: NSNotification.Name("ingredientAlert.productsLoaded"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.ingredientsProductsLoadedHandler(notification:)), name: NSNotification.Name("ingredientAlert.ingredientsLoaded"), object: nil)
        
    }
    
    @objc func ingredientsProductsLoadedHandler(notification: NSNotification) {
        print("handler called")
        
        if
            (!self.ingredientListViewModel.ingredientRepository.ingredients.isEmpty &&
            !self.productListViewModel.productRepository.productsBE.isEmpty
            ){
            print("all data loaded!")
            print("ingredientsCount: ", self.ingredientListViewModel.ingredientRepository.ingredients.count)
            print("productsCount: ", self.productListViewModel.productRepository.productsBE.count)
            print("user data is loaded")
            if self.authViewModel.currentUser != nil {
                self.authViewModel.currentUserFlaggedDict = self.authViewModel.getCurrentFlaggedDict(flaggedListId: self.authViewModel.currentUser!.flaggedListId, ingredientsList: self.ingredientListViewModel.ingredientRepository.ingredients)
            }

            self.productListViewModel.productRepository.productsFE = convertBEProductsListToFE(BEProducts: self.productListViewModel.productRepository.productsBE, ingredientDict: self.ingredientListViewModel.ingredientRepository.ingredientsDict, userFlaggedDict: authViewModel.currentUserFlaggedDict)
            self.dataLoaded = true
            

        } else {
            print("data still missing")
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("ingredientAlert.userDataLoaded"), object: nil)
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

