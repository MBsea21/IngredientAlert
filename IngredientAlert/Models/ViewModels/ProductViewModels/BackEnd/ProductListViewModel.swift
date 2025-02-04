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
        print("line 28 in Product Authentication form protocol complete")
    }
    func addProduct(name: String, brand : String, use: String, useArea: String, inputProductIngredients: [String], uploaderId: String) {
        let productAddedtoBE = productRepository.addProduct(name: name,
                                                            brand: brand,
                                                            use: use,
                                                            useArea: useArea,
                                                            uploaderId: uploaderId,
                                                            inputProductIngredients: inputProductIngredients
                                                            
                                     )
        if productAddedtoBE == true {
            print("Succesfully added product to backend")
        } else {
            print("did not add product to backend due to error")
        }
    }
}
