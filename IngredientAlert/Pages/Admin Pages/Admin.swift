//
//  Admin.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//
import SwiftUI

struct Admin: View {
    @EnvironmentObject var modelData: ModelData
    @State private var addCommonIngredientsIsOn: Bool = false
    @State private var addOtherIngredientNamesIsOn: Bool = false
    @State private var addMissingIngredientsisOn: Bool = false
    var productList: [ProductFE]
    
    var body: some View {
        Section{
            ScrollView{
                Text("Ingredients")
                Toggle("Add Common Ingredient", isOn: $addCommonIngredientsIsOn)
                    .fontWeight(.semibold)
                    .padding()
                
                
                if addCommonIngredientsIsOn {
                    Section{
                        AddCommonIngredientForm()
                            .environmentObject(modelData)
                    }.frame(width:400, height: 400)

                }
                Toggle("Add Ingredient names to common ingredient", isOn: $addOtherIngredientNamesIsOn)
                    .fontWeight(.semibold)
                    .padding()
                if addOtherIngredientNamesIsOn {
                    CommonIngredientNameList()
                        .environmentObject(modelData)
                    
                }
                Toggle("Add Missing Ingredients", isOn: $addMissingIngredientsisOn)
                    .fontWeight(.semibold)
                    .padding()
                if addMissingIngredientsisOn {
                    AddMissingIngredientsForm(productList:productList)
                        .environmentObject(modelData)
                    
                }
                Spacer()
            }
        }.padding()
    }
}

