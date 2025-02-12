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
    @Published var ingredientRepository = IngredientRepository ()
    private var cancellables: Set<AnyCancellable> = []
    
    init () {
        ingredientRepository.$ingredients
            .sink { ingredients in
                self.ingredientViewModels = ingredients.map { IngredientViewModel(ingredient:$0, ingredientRepository: self.ingredientRepository) }
        }
        .store(in: &cancellables)
    }
    func addCommon(inputName: String, commonName: String, isCommonName: Bool, isFlagged: Bool, sourceUrl: String, pubChemUrl: String) async throws {
        try await ingredientRepository.addCommon(inputName: inputName,
                                       commonName: commonName,
                                       isCommonName: true,
                                       isFlagged: isFlagged,
                                       sourceUrl: sourceUrl,
                                       pubChemUrl: pubChemUrl)
    }
    func addOtherName(inputName: String, commonName: String, isCommonName: Bool, commonNameId: String, isFlagged: Bool, sourceUrl: String, pubChemUrl: String) {
        ingredientRepository.addOtherName(inputName: inputName,
                                       commonName: commonName,
                                       isCommonName: false,
                                       commonNameId: commonNameId,
                                       isFlagged: isFlagged,
                                       sourceUrl: sourceUrl,
                                       pubChemUrl: pubChemUrl)
    }
}

