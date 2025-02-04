//
//  IngredientRepository.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

import Foundation
import FirebaseFirestore
import Combine

class IngredientRepository: ObservableObject {
    private let path: String = "ingredients"
    private let store = Firestore.firestore()
    
    @Published var ingredients: [Ingredient] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init () {
        self.get()
    }
    
    func get() {
        store.collection(path)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting ingredients: \(error.localizedDescription)")
                    return
                }
                self.ingredients = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: Ingredient.self)
                } ?? []
                
            }
    }
    func addCommon(inputName: String, commonName: String, isCommonName: Bool, isFlagged: Bool, sourceUrl: String, pubChemUrl: String) {
        do {
            let newCommonReference = store.collection(path).document()
            let newCommonIngredientId = newCommonReference.documentID
            let newCommonIngredient = Ingredient(id: newCommonIngredientId,
                                                 inputName: inputName.lowercased(),
                                                 commonName: commonName.lowercased(),
                                                 isCommonName: true,
                                                 commonNameId: newCommonIngredientId,
                                                 isFlagged: isFlagged,
                                                 sourceUrl: sourceUrl,
                                                 pubChemUrl: pubChemUrl)
            do {
                try store.collection(path).document(newCommonIngredientId).setData(from: newCommonIngredient)
            }
            
        } catch {
            fatalError("DEBUG: unable to add Common Ingredient: \(error.localizedDescription)")
        }
    }
    func addOtherName(inputName: String, commonName: String, isCommonName: Bool, commonNameId: String, isFlagged: Bool, sourceUrl: String, pubChemUrl: String) {
        do {
            let newOtherNameRefrence = store.collection(path).document()
            let newOtherNameIngredientId = newOtherNameRefrence.documentID
            let newOtherNameIngredient = Ingredient(id: newOtherNameIngredientId,
                                                    inputName: inputName.lowercased(),
                                                    commonName: commonName.lowercased(),
                                                    isCommonName: false,
                                                    commonNameId: commonNameId,
                                                    isFlagged: isFlagged,
                                                    sourceUrl: sourceUrl,
                                                    pubChemUrl: pubChemUrl)
            do {
                try store.collection(path).document(newOtherNameIngredientId).setData(from:newOtherNameIngredient)
            } catch {
                fatalError("DEBUG: unable to add other ingredient name \(inputName): \(error.localizedDescription)")
            }
        }
    }
    func addIngredientFromProductForm(inputName: String) -> String{
        do {
            let newProductIngredientReference = store.collection(path).document()
            let newProductIngredientId = newProductIngredientReference.documentID
            let newProductIngredient = Ingredient(id:newProductIngredientId,
                                                  inputName: inputName.lowercased(),
                                                  commonName: inputName.lowercased(),
                                                  isCommonName: true,
                                                  commonNameId: newProductIngredientId,
                                                  isFlagged: false,
                                                  sourceUrl: "",
                                                  pubChemUrl: ""
            )
            do {
                try store.collection(path).document(newProductIngredientId).setData(from:newProductIngredient)
                return newProductIngredientId
            } catch {
                fatalError("DEBUG: unable to add product ingredient \(newProductIngredientId) to ingredient list: \(error.localizedDescription)")
            }
        }
            
    }
    
    func update(_ ingredient: Ingredient) {
        guard let ingredientId = ingredient.id else { return }
        do {
            try store.collection(path).document(ingredientId).setData(from: ingredient)
        } catch {
            fatalError("DEBUG: unable to update ingredient: \(error.localizedDescription)")
        }
    }
    
    func remove(_ ingredient: Ingredient) {
        guard let ingredientId = ingredient.id else { return }
        store.collection(path).document(ingredientId).delete { error in
            if let error = error {
                print("DEBUG: unable to remove ingredient \(error.localizedDescription)")
            }
        }
    }
}
