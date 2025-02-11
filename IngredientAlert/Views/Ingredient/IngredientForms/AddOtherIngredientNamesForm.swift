//
//  AddOtherIngredientNamesForm.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

import SwiftUI
import FirebaseFirestore

struct AddOtherIngredientNamesForm: View {
    @EnvironmentObject var modelData: ModelData
    var ingredient: Ingredient
    @State private var multipleNamesIsOn: Bool = false
    @State private var inputNames: String = ""
    @State private var commonNameId: String = ""
    @State private var isLoading: Bool = false
    
    
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
                if isLoading {
                    ProgressView("Adding ingredients....")
                        .padding()
                } else {
                    Button {
                        Task { await updateCommonNameIngredient()
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
        
    }
    
    private func updateCommonNameIngredient () async {
        let commonNameId = ingredient.commonNameId
        let commonName = ingredient.commonName
        let isFlagged = ingredient.isFlagged
        let sourceUrl = ingredient.sourceUrl
        let pubChemUrl = ingredient.pubChemUrl
        isLoading = true
        if multipleNamesIsOn {
            let nameList : [String] = inputNames.components(separatedBy: "*")
            
            do {
                try await modelData.ingredientListViewModel.ingredientRepository.batchIngredientAdd(nameList: nameList,
                                                                                                    commonName: commonName,
                                                                                                    commonNameId: commonNameId!,
                                                                                                    sourceUrl: sourceUrl,
                                                                                                    pubChemUrl:pubChemUrl,
                                                                                                    isFlagged: isFlagged)
                
            } catch {
                print("Failed to add ingredients: \(error.localizedDescription)")
            }
            isLoading = false
            inputNames = ""
        }
        
    }
    
    
}
