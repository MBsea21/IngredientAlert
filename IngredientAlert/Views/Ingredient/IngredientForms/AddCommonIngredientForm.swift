//
//  AddCommonIngredientForm.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

import SwiftUI

struct AddCommonIngredientForm: View {
    @State private var commonName = ""
    @State private var isFlagged: Bool = false
    @State private var sourceUrl = ""
    @State private var pubChemUrl = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var modelData: ModelData
    @State private var isLoading: Bool = false
    
    
    var body: some View {
        ZStack {
            Section{
                NavigationStack{
                    ScrollView{
                        //form fields
                        VStack(spacing: 24){
                            InputView(text: $commonName,
                                      title: "Ingredient Common Name",
                                      placeholder: "Calcium")
                            .autocorrectionDisabled(true)
                            
                            InputView(text:$sourceUrl,
                                      title:"Source Url",
                                      placeholder: "www.pubmed.com"
                            )
                            .autocorrectionDisabled(true)
                            
                            
                            
                            InputView(text:$pubChemUrl,
                                      title:"PubChemUrl",
                                      placeholder: "www.pubChem.com"
                            )
                            .autocorrectionDisabled(true)
                            
                            
                            Toggle("Is Flagged", isOn: $isFlagged)
                            
                            
                            if isLoading == true {
                                ProgressView("Adding Common Ingredent....")
                                    .padding()
                                
                            } else {
                                Button{
                                    Task {
                                        await addCommonIngredient()
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
                        .padding(.horizontal)
                        .padding(.top, 12)
                        
                    }
                }
                if isLoading {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            
        }
    }
    private func addCommonIngredient () async {
        guard !isLoading else { return }
        
        DispatchQueue.main.async {
            isLoading = true
        }
        do {
        try await modelData.ingredientListViewModel.addCommon(inputName: commonName,
                                                          commonName: commonName,
                                                          isCommonName: true,
                                                          isFlagged: isFlagged,
                                                          sourceUrl: sourceUrl,
                                                          pubChemUrl: pubChemUrl
        )
            dismiss()
            
            isLoading = false
            commonName = ""
            isFlagged = false
            sourceUrl = ""
            pubChemUrl = ""
            dismiss()
            
        } catch {
            print("Failed to add ingredient: \(error.localizedDescription)")
            await MainActor.run {
                
            }
        }
        
        
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

