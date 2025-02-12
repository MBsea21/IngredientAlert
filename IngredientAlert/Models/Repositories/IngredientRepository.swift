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
    @Published var ingredientsDict: [String: Ingredient] = [:]
    
    private var cancellables: Set<AnyCancellable> = []
    
    private func setIngredientDict () {
        for ingredient in ingredients {
            ingredientsDict[ingredient.inputName] = ingredient
        }
    }
    
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
                
                
                NotificationCenter.default.post(name: NSNotification.Name("ingredientAlert.ingredientsLoaded"), object: nil)
                DispatchQueue.main.async {
                    self.setIngredientDict()
                }
            }
    }
    func addCommon(inputName: String, commonName: String, isCommonName: Bool, isFlagged: Bool, sourceUrl: String, pubChemUrl: String) async throws {
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
                self.ingredients.append(newCommonIngredient)
                self.setIngredientDict()
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
                self.ingredients.append(newOtherNameIngredient)
                self.setIngredientDict()
            } catch {
                fatalError("DEBUG: unable to add other ingredient name \(inputName): \(error.localizedDescription)")
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
                if error != nil {
                    print("Debug unable to delete ingredient")
                }
            }
    }
    func batchIngredientAdd( nameList: [String], commonName: String, commonNameId: String, sourceUrl: String, pubChemUrl: String, isFlagged: Bool) async throws{
        let batch = store.batch()
        for name in nameList {
            let newOtherNameReference = store.collection("ingredients").document()
            let newOtherNameIngredientId = newOtherNameReference.documentID
            let newOtherNameIngredient = Ingredient(id: newOtherNameIngredientId,
                                                    inputName: name.lowercased(),
                                                    commonName: commonName.lowercased(),
                                                    isCommonName: false,
                                                    commonNameId: commonNameId,
                                                    isFlagged: isFlagged,
                                                    sourceUrl: sourceUrl,
                                                    pubChemUrl: pubChemUrl)
            do {
                try batch.setData(from: newOtherNameIngredient, forDocument: newOtherNameReference)
            } catch {
                print("Error adding ingredient to batch: \(error.localizedDescription)")
                throw error
            }
        }
        do {
            try await batch.commit()
            print("Batch write succeded!")
        } catch {
            print("Batch write failed: \(error.localizedDescription)")
            throw error
        }
    }
    
}
