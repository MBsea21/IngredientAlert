//
//  IngredientViewModel.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//
import Foundation
import Combine

class IngredientViewModel: ObservableObject, Identifiable {
    private var ingredientRepository: IngredientRepository
    @Published var ingredient: Ingredient
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(ingredient: Ingredient, ingredientRepository: IngredientRepository) {
        self.ingredient = ingredient
        self.ingredientRepository = ingredientRepository
        
        $ingredient
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    func update(ingredient: Ingredient) {
        ingredientRepository.update(ingredient)
    }
    func remove() {
        ingredientRepository.remove(ingredient)
    }
}
