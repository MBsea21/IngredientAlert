//
//  ProductListViewModel.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/3/25.
//
import Foundation
import Combine

protocol ProductAuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

class ProductListViewModel: ObservableObject {
    @Published var productViewModels: [ProductViewModel] = []

    private var cancellables: Set<AnyCancellable> = []
    
    @Published var productRepository = ProductRepository()
    
    init () {
        productRepository.$productsBE.map { products in
            products.map(ProductViewModel.init)
        }
        .assign(to:\.productViewModels, on: self)
        .store(in: &cancellables)
    }
    func addProduct(name: String, brand : String, use: String, useArea: String, inputProductIngredients: [String], uploaderId: String) async throws {
        try await productRepository.addProduct(name: name,
                                                            brand: brand,
                                                            use: use,
                                                            useArea: useArea,
                                                            uploaderId: uploaderId,
                                                            inputProductIngredients: inputProductIngredients
                                                            
                                     )
        }
    }

