//
//  AddOtherIngredientNamesForm.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

import SwiftUI

struct AddOtherIngredientNamesForm: View {
    @EnvironmentObject var modelData: ModelData
    var ingredient: Ingredient
    @State private var multipleNamesIsOn: Bool = false
    @State private var inputNames: String = ""
    @State private var commonNameId: String = ""
    
    var body: some View{
        
        Text(ingredient.commonName)
        Toggle("Add Multiple Names", isOn: $multipleNamesIsOn)
        if multipleNamesIsOn {
            VStack{
                InputView(text: $inputNames,
                          title:"inputNames",
                          placeholder: "Separate names with *~" )
                .autocorrectionDisabled(true)
                .padding()
                
                Button {
                    Task {
                        updateCommonNameIngredient()
                    }
                    
                }label: {
                    
                    HStack{
                        Text("Add Names")
                        Image(systemName:"plus.circle")
                        
                    }
                    .foregroundColor(.white)
                    .frame(width:350, height: 48)
                    .cornerRadius(10)
                    .background(Color(.bTeal))
                    
                }
                
                
                
            }
            
        }
        
    }
    
    private func updateCommonNameIngredient () {
        let commonNameId = ingredient.commonNameId
        let commonName = ingredient.commonName
        let isFlagged = ingredient.isFlagged
        let sourceUrl = ingredient.sourceUrl
        let pubChemUrl = ingredient.pubChemUrl
        
        if multipleNamesIsOn {
            let nameList : [String] = inputNames.components(separatedBy: "*")
            for name in nameList {
                
                modelData.ingredientListViewModel.addOtherName(inputName: name,
                                                               commonName: commonName,
                                                               isCommonName: false,
                                                               commonNameId: "\(String(describing: commonNameId))",
                                                               isFlagged: isFlagged,
                                                               sourceUrl: sourceUrl,
                                                               pubChemUrl: pubChemUrl)
                
            }
        }
        
    }
    
    
}
