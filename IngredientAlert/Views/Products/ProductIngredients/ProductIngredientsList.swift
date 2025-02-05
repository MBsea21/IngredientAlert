//
//  ProductIngredientsList.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/21/25.
//

import SwiftUI
import Foundation

struct ProductIngredientsList: View {
    @EnvironmentObject var modelData: ModelData
    @State var showIngredientDetails : Bool = false
    var product : ProductFE

    var body: some View {
        let flaggedIngredients = product.flaggedIngredients
        let unflaggedIngredients = product.unflaggedIngredients
        let unaddedIngredients = product.unaddedIngredients
        Section {
            HStack {
                Text("Ingredients")
                    .font(.title3)
                    .scaledToFill()
                    .padding()
                    .accessibilityLabel("Product Ingredients Menu")
                Spacer()
                VStack{
                    Section{
                        Text("Details")
                            .scaledToFill()
                            .frame(width : 60, height:15)
                        
                        Toggle("Show Details", isOn:$showIngredientDetails)
                            .frame(width: 100)
                            .font(.callout)
                            .labelsHidden()
                    }
                }
            }
        }
            
            if showIngredientDetails {
                IngredientClickableList(flaggedIngredients: flaggedIngredients, unflaggedIngredients: unflaggedIngredients, unaddedIngredients: unaddedIngredients)
                
            } else {
                ProductIngredientParagraph(flaggedIngredients: flaggedIngredients, unflaggedIngredients: unflaggedIngredients, unaddedIngredients: unaddedIngredients)
            }
        }

    }
    

                
        
    
    

//#Preview {
//    let modelData = ModelData()
//    return ProductIngredientsList(product: modelData.products[0])
//        .environmentObject(modelData)
//}
//
