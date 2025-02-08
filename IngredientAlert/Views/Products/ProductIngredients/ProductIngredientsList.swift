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
    
    var flaggedKey: AttributedString{
        var result = AttributedString("red = flagged")
        result.foregroundColor = .red
        
        return result
    }
    var unflaggedKey: AttributedString{
        var result = AttributedString("Dark Gray = unflagged")
        result.foregroundColor = .gray
        
        return result
    }
    var unanalizedKey: AttributedString {
        var result = AttributedString("gray = uanalyzed.")
        result.foregroundColor = .lightGray
        return result
    }
    
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
        Section{
            if showIngredientDetails {
                IngredientClickableList(flaggedIngredients: flaggedIngredients, unflaggedIngredients: unflaggedIngredients, unaddedIngredients: unaddedIngredients)
                
            } else {
                ProductIngredientParagraph(flaggedIngredients: flaggedIngredients, unflaggedIngredients: unflaggedIngredients, unaddedIngredients: unaddedIngredients)
            }
            Section{
                if flaggedIngredients != [] && unflaggedIngredients != [] && unaddedIngredients != [] {
                    Text(flaggedKey + " | " + unflaggedKey + " | " + unanalizedKey)
                } else if flaggedIngredients != [] && unflaggedIngredients != [] && unaddedIngredients == [] {
                    Text(flaggedKey + " | " + unflaggedKey )
                } else if flaggedIngredients != [] && unflaggedIngredients == [] && unaddedIngredients != [] {
                    Text(flaggedKey + " | " + unanalizedKey )
                } else if flaggedIngredients == [] && unflaggedIngredients != [] && unaddedIngredients != [] {
                    Text(unflaggedKey + " | " + unanalizedKey )
                } else if flaggedIngredients == [] && unflaggedIngredients == [] && unaddedIngredients != [] {
                    Text(unanalizedKey)
                } else if flaggedIngredients == [] && unflaggedIngredients != [] && unaddedIngredients == [] {
                    Text(unflaggedKey)
                } else if flaggedIngredients != [] && unflaggedIngredients == [] && unaddedIngredients == [] {
                    Text(flaggedKey)
                }
            }.font(.footnote)
            
            
        }
        
    }
    
}
                
        
    
    

//#Preview {
//    let modelData = ModelData()
//    return ProductIngredientsList(product: modelData.products[0])
//        .environmentObject(modelData)
//}
//
