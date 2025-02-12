//
//  Home.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Home : View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText:String  = ""
    //    @State private var filtersIsOn: Bool = false
    //    @State private var showFlagged: Bool = true
    @State var filteredProducts: [ProductFE] = []

    
    
    private func textSearchProducts(textinput:String, productNameDict: [String: ProductFE]) -> [ProductFE] {
        print("dicitonary: \(productNameDict)")
        print("textInput: \(textinput)")
        var result: [ProductFE] = []
        let lowercasedText = textinput.lowercased()
        let spacesRemovedText = lowercasedText.replacingOccurrences(of: " ", with: "")
        if spacesRemovedText == "" {
            return modelData.productListViewModel.productRepository.productsFE
        }
        for (productName, value) in productNameDict {
            print(productName)
            print(spacesRemovedText)
            
            if productName.lowercased().replacingOccurrences(of: " ", with: "").contains(spacesRemovedText) {
                result.append(value)
            }
            else if value.brand.lowercased().replacingOccurrences(of: " ", with: "").contains(spacesRemovedText) {
                result.append(value)
            } else if value.use.lowercased().replacingOccurrences(of: " ", with: "").contains(spacesRemovedText) {
                result.append(value)
                
            } else if value.useArea.lowercased().replacingOccurrences(of: " ", with: "").contains(spacesRemovedText) {
                        result.append(value)
                }
                            
            
        }
        return result
    }
    
    var body: some View {
        var productNameDict = modelData.productListViewModel.productRepository.productsDict
        VStack{
            Section{
                InputView(text:$searchText, title: "Search", placeholder: "Search for products here...")
                Spacer()
            }
            let filteredList = textSearchProducts(textinput: searchText, productNameDict: productNameDict)
            
            if searchText != "" {
                Section {
                    ProductList(productsList:(textSearchProducts(textinput: searchText, productNameDict: productNameDict)))
                        .environmentObject(modelData)
                }
            } else {
                let filteredList = textSearchProducts(textinput: searchText, productNameDict:productNameDict)
                Section{
                    ProductList(productsList: filteredList)
                        .environmentObject(modelData)
                }
            }
        }.padding()
    }
    
}
