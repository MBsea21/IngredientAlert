//
//  Home.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Home : View {
    @EnvironmentObject var modelData: ModelData
    @State var productsList: [ProductFE]
    @State private var searchText = ""
    @State private var filtersIsOn: Bool = false
    @State private var showFlagged: Bool = true
    @State var filteredProducts: [ProductFE] = []
    @State var productNameDict: [String:ProductFE] = [:]
    
    
    private func getProductNameDict(products: [ProductFE]) -> [String: ProductFE] {
        var dict: [String: ProductFE] = [:]
        for product in products {
            dict[product.name] = product
        }
        return dict
    }
    
    //private func getProductBrandsDict(products: [ProductFE] -> [String: [ProductFE])
    private func textSearchProducts(textinput:String, productNameDict: [String: ProductFE]) -> [ProductFE] {
        var result: [ProductFE] = []
        let lowercasedText = textinput.lowercased()
        let spacesRemovedText = lowercasedText.replacingOccurrences(of: " ", with: "")
        for (productName, value) in productNameDict {
            if productName.contains(spacesRemovedText) {
                result.append(value)
            }
            
        }
        return result
    }
    
    var body: some View {
        let productNameDict = getProductNameDict(products: productsList)
        VStack{
            Section{
                InputView(text:$searchText, title: "Search", placeholder: "Search for products here...")
                Toggle("Additional Filters", isOn: $filtersIsOn)
                if filtersIsOn == true {
                    Section {
                        Toggle("Show Flagged", isOn: $showFlagged)
                    }
                }
                Spacer()
            }
            if searchText != "" {
                Section {
                    ProductList(productsList:(textSearchProducts(textinput: searchText, productNameDict: productNameDict)))
                        .environmentObject(modelData)
                }
            } else {
                Section{
                    ProductList(productsList: productsList)
                        .environmentObject(modelData)
                }
            }
        }.padding()
    }
    
}
//#Preview {
//    Home()
//}
