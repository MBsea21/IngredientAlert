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
    
    var userFlaggedKey: AttributedString {
        var result = AttributedString("Orange = Personal Flagged")
        result.foregroundColor = .systemOrange
        
        return result
    }
    
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
        let userFlaggedIngredient = product.userFlaggedIngredients
        let flaggedIngredients = product.flaggedIngredients
        let unflaggedIngredients = product.unflaggedIngredients
        let unaddedIngredients = product.unaddedIngredients
        ScrollView {
            HStack {
                Text("Ingredients")
                    .font(.title3)
                    .scaledToFit()
                    .padding()
                    .accessibilityLabel("Product Ingredients Menu")
                Spacer()
                VStack{
                    Section{
                        Text("Details")
                            .scaledToFill()
                            .frame(width : 20)
                        
                        Toggle("Show Details", isOn:$showIngredientDetails)
                            .frame(width: 100)
                            .font(.callout)
                            .labelsHidden()
                    }
                }
            }.padding()
        }
        Section{
            if showIngredientDetails {
                IngredientClickableList(flaggedIngredients: flaggedIngredients, userFlaggedIngredients: userFlaggedIngredient, unflaggedIngredients: unflaggedIngredients, unaddedIngredients: unaddedIngredients)
                
            } else {
                
                    ProductIngredientParagraph(flaggedIngredients: flaggedIngredients, unflaggedIngredients: unflaggedIngredients, userFlaggedIngredients: userFlaggedIngredient, unaddedIngredients: unaddedIngredients)
                }
                Section{
                    if !userFlaggedIngredient.isEmpty && !flaggedIngredients.isEmpty && !unflaggedIngredients.isEmpty && !unaddedIngredients.isEmpty {
                        Text(userFlaggedKey + " | " + flaggedKey + " | " + unflaggedKey + " | " + unanalizedKey)
                    } else if !userFlaggedIngredient.isEmpty && !flaggedIngredients.isEmpty && !unflaggedIngredients.isEmpty && unaddedIngredients.isEmpty {
                        Text(userFlaggedKey + " | " + flaggedKey + " | " + unflaggedKey )
                    } else if !userFlaggedIngredient.isEmpty && !flaggedIngredients.isEmpty && unflaggedIngredients.isEmpty && !unaddedIngredients.isEmpty {
                        Text(userFlaggedKey + " | " + flaggedKey + " | " + unanalizedKey )
                    } else if !userFlaggedIngredient.isEmpty && flaggedIngredients.isEmpty && !unflaggedIngredients.isEmpty && !unaddedIngredients.isEmpty {
                        Text(userFlaggedKey + " | " + unflaggedKey + " | " + unanalizedKey )
                    } else if !userFlaggedIngredient.isEmpty && flaggedIngredients.isEmpty && unflaggedIngredients.isEmpty && !unaddedIngredients.isEmpty {
                        Text(userFlaggedKey + " | " + unanalizedKey)
                    } else if !userFlaggedIngredient.isEmpty && flaggedIngredients.isEmpty && !unflaggedIngredients.isEmpty && unaddedIngredients.isEmpty {
                        Text(userFlaggedKey + " | " + unflaggedKey)
                    } else if !userFlaggedIngredient.isEmpty && !flaggedIngredients.isEmpty && unflaggedIngredients.isEmpty && unaddedIngredients.isEmpty {
                        Text(userFlaggedKey + " | " + flaggedKey)
                    }else if userFlaggedIngredient.isEmpty && !flaggedIngredients.isEmpty && !unflaggedIngredients.isEmpty && unaddedIngredients.isEmpty {
                        Text( flaggedKey + " | " + unflaggedKey + " | " + unanalizedKey)
                    } else if userFlaggedIngredient.isEmpty && !flaggedIngredients.isEmpty && !unflaggedIngredients.isEmpty  && unaddedIngredients.isEmpty {
                        Text(flaggedKey + " | " + unflaggedKey )
                    } else if userFlaggedIngredient.isEmpty && !flaggedIngredients.isEmpty && unflaggedIngredients.isEmpty && !unaddedIngredients.isEmpty {
                        Text( flaggedKey + " | " + unanalizedKey )
                    } else if userFlaggedIngredient.isEmpty && flaggedIngredients.isEmpty && !unflaggedIngredients.isEmpty && !unaddedIngredients.isEmpty {
                        Text( unflaggedKey + " | " + unanalizedKey )
                    } else if userFlaggedIngredient.isEmpty && flaggedIngredients.isEmpty && unflaggedIngredients.isEmpty && !unaddedIngredients.isEmpty {
                        Text(unanalizedKey)
                    } else if userFlaggedIngredient.isEmpty && flaggedIngredients.isEmpty && !unflaggedIngredients.isEmpty && unaddedIngredients.isEmpty {
                        Text(unflaggedKey)
                    } else if userFlaggedIngredient.isEmpty && !flaggedIngredients.isEmpty && unflaggedIngredients.isEmpty && unaddedIngredients.isEmpty{
                        Text(flaggedKey)
                    }
                }.font(.footnote)
                .padding()
                
                
            }
        }
        
    }
    

                
        
    
    

//#Preview {
//    let modelData = ModelData()
//    return ProductIngredientsList(product: modelData.products[0])
//        .environmentObject(modelData)
//}
//
