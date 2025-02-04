//
//  ProductRepository.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/3/25.
//

import Foundation
import FirebaseFirestore
import Combine

class ProductRepository: ObservableObject {
    private let path: String = "products"
    private let store = Firestore.firestore()
    
    @Published var productsBE: [ProductBE] = []
    @Published var productsFE: [ProductFE] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    init () {
        self.get()
    }
    
    func get() {
        store.collection(path)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting products: \(error.localizedDescription)")
                    return
                }
                self.productsBE = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: ProductBE.self)
                } ?? []
                
            }
    }
    func addProduct(name: String, brand: String, use:String, useArea: String, uploaderId: String, inputProductIngredients: [String]) -> Bool {
        do {
            let newProductReference = store.collection(path).document()
            let newProductId = newProductReference.documentID
            let newProduct = ProductBE(id: newProductId,
                                       name: name,
                                       brand: brand,
                                       use: use,
                                       useArea: useArea,
                                       inputProductIngredients: inputProductIngredients,
                                       uploaderId: uploaderId
                                       
            )
            do {
                try store.collection(path).document(newProductId).setData(from: newProduct)
            }
            
        } catch {
            fatalError("DEBUG: unable to add Product: \(error.localizedDescription)")
        }
        return true
    }
    
    func update(_ product: ProductBE) {
        guard let productId = product.id else { return }
        do {
            try store.collection(path).document(productId).setData(from: product)
        } catch {
            fatalError("DEBUG: unable to update Product: \(error.localizedDescription)")
        }
    }
    
    func remove(_ product: ProductBE) {
        guard let productId = product.id else { return }
        store.collection(path).document(productId).delete { error in
            if let error = error {
                print("DEBUG: unable to remove product \(error.localizedDescription)")
            }
        }
    }
}
