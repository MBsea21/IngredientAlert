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
            let newCommonIngredient = Ingredient(id: newCommonIngredientId,inputName: inputName, commonName: commonName, isCommonName: true, commonNameId: newCommonIngredientId, isFlagged: isFlagged, sourceUrl: sourceUrl, pubChemUrl: pubChemUrl)
            do {
                try store.collection(path).document(newCommonIngredientId).setData(from: newCommonIngredient)
            }
            
        } catch {
            fatalError("DEBUG: unable to add Common Ingredient: \(error.localizedDescription)")
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
