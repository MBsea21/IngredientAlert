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
        print("line 28 in ingredientauthenticationformprotocol complete")
    }
    func addCommon(inputName: String, commonName: String, isCommonName: Bool, isFlagged: Bool, sourceUrl: String, pubChemUrl: String) {
        ingredientRepository.addCommon(inputName: inputName,
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
    func addProductIngredient(inputName:String) -> String{
        return ingredientRepository.addIngredientFromProductForm(inputName: inputName)
    }
}

