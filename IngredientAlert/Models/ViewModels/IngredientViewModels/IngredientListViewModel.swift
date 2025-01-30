//
//  IngredientListViewModel.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

import Foundation
import Combine

protocol IngredientAuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

class IngredientListViewModel: ObservableObject {
    @Published var ingredientViewModels: [IngredientViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var ingredientRepository = IngredientRepository()
    
    init () {
        ingredientRepository.$ingredients.map { ingredients in
            ingredients.map(IngredientViewModel.init)
        }
        .assign(to:\.ingredientViewModels, on: self)
        .store(in: &cancellables)
    }
    func addCommon(inputName: String, commonName: String, isCommonName: Bool, isFlagged: Bool, sourceUrl: String, pubChemUrl: String) {
        ingredientRepository.addCommon(inputName: inputName,
                                       commonName: commonName,
                                       isCommonName: isCommonName,
                                       isFlagged: isFlagged,
                                       sourceUrl: sourceUrl,
                                       pubChemUrl: pubChemUrl)
    }
}
