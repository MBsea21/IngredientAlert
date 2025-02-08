//
//  ProductViewViewModel.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/7/25.
//

import Foundation

class ProductsViewViewModel: ObservableObject {
    @Published var productView: [ProductFE] = []
    
    var productsRepository: Published<ProductRepository>.Publisher
    var ingredientsRepository: Published<IngredientRepository>.Publisher
    
    init(productsRepository: Published<ProductRepository>.Publisher, ingredientsRepository: Published<IngredientRepository>.Publisher) {
        self.productsRepository = productsRepository
        self.ingredientsRepository = ingredientsRepository
    }
    
}
