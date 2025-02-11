//
//  ToggleComponent.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/5/25.
//
import SwiftUI

struct MissingWordToggleView: View {
    @EnvironmentObject var modelData : ModelData
    var word: String
    @State var text: String = ""
    @State var sourceUrl: String =  ""
    @State var pubChemUrl: String = ""
    @State var isFlagged: Bool = false
    @State var isCommon: Bool = false
    @State var commonName: String = ""
    @Environment(\.dismiss) var dismiss
    @State private var isLoading: Bool = false
    
    
    @State private var wordToggle = false
    
    var body: some View {
        VStack(spacing: 0) {
            Toggle(word, isOn: $wordToggle)
                .padding(.horizontal)
            
            if wordToggle == true {
                Text("Add \(word)")
                ScrollView{
                    Toggle("Is Common Name", isOn: $isCommon)
                    if isCommon == true {
                        var commonName = word
                    } else {
                        InputView(text:$commonName, title: "CommonName", placeholder: "common name")
                    }
                    InputView(text:$text, title: "name", placeholder: "string ")
                    InputView(text:$sourceUrl, title: "SourceURL", placeholder:"www.pubMed.com")
                    InputView(text:$pubChemUrl, title:"Chem URL", placeholder:"www.pubchem.com")
                    Toggle("IsFlagged", isOn: $isFlagged)
                    
                    Button{
                        Task {
                            await addCommonIngredient()
                        }
                    } label: {
                        HStack {
                            if isLoading == true {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Text("Add Common Ingredient")
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                            }
                        }
                        .foregroundColor(.white)
                        .frame(width: 350, height: 48)
                    }
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
                    .padding(.top, 24)
                }
            }
        }
    }
    private func addCommonIngredient () async {
        guard !isLoading else { return }
        isLoading = true
        
        do {
            try await modelData.ingredientListViewModel.addCommon(inputName: text,
                                                                  commonName: commonName,
                                                                  isCommonName: true,
                                                                  isFlagged: isFlagged,
                                                                  sourceUrl: sourceUrl,
                                                                  pubChemUrl: pubChemUrl )
            wordToggle = false
            dismiss()
            
            //reset fields
            text = ""
            sourceUrl = ""
            pubChemUrl = ""
            isFlagged = false
            isCommon = false
            commonName = ""
            
        } catch {
            print("failed attempt at adding common ingredient\(error.localizedDescription)")
        }
                  isLoading = false
           
    }
                    
}
