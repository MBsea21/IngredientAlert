//
//  AddCommonIngredientForm.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

import SwiftUI

struct AddCommonIngredientForm: View {
    @State private var commonName = ""
    @State private var isFlagged: Bool = true
    @State private var sourceUrl = ""
    @State private var pubChemUrl = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        ZStack {
            Section{
                NavigationStack{
                    ScrollView{
                        Text("Add Common Ingredient Form")
                            .font(.title)
                        //form fields
                        VStack(spacing: 24){
                            InputView(text: $commonName,
                                      title: "Ingredient Common Name",
                                      placeholder: "Calcium")
                            .autocorrectionDisabled(true)
                            
                            //                    InputView(text: $isFlagged,
                            //                              title: "Full Name",
                            //                              placeholder: "Jane Doe")
                            //                    .autocorrectionDisabled(true)
                            
                            InputView(text:$sourceUrl,
                                      title:"Source Url",
                                      placeholder: "www.pubmed.com"
                            )
                            .autocorrectionDisabled(true)
                            
                            ZStack(alignment: .trailing){
                                InputView(text:$pubChemUrl,
                                          title:"PubChemUrl",
                                          placeholder: "www.pubChem.com"
                                )
                                .autocorrectionDisabled(true)
                                
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 12)
                    
                    
                    // signin button
                    Button{
                        Task {
                            addCommonIngredient()
                        }
                    } label: {
                        HStack {
                            Text("Add Common Ingredient")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .frame(width: 350, height: 48)
                    }
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .padding(.top, 24)
                    
                }
                
            }
        }
    }
        private func addCommonIngredient () {
            modelData.ingredientListViewModel.addCommon(inputName: commonName,
                                                        commonName: commonName,
                                                        isCommonName: true,
                                                        isFlagged: isFlagged,
                                                        sourceUrl: sourceUrl,
                                                        pubChemUrl: pubChemUrl )
            
            
        }
    
}
    


// MARK: AuthenticationFormProtocol
extension AddCommonIngredientForm: IngredientAuthenticationFormProtocol {
    var formIsValid: Bool {
        return !commonName.isEmpty
        && !sourceUrl.isEmpty
        && !pubChemUrl.isEmpty
    }
}




struct AddCommonIngredientForm_Previews: PreviewProvider {
    static var previews: some View {
        AddCommonIngredientForm()
    }
}

