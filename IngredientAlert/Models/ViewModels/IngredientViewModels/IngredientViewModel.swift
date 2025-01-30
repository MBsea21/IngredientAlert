//
//  IngredientViewModel.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//
import Foundation
import Combine

class IngredientViewModel: ObservableObject, Identifiable {
    private let ingredientRepository = IngredientRepository()
    @Published var ingredient: Ingredient
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(ingredient: Ingredient) {
        self.ingredient = ingredient
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
