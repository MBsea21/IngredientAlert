//
//  NewProductForm.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/3/25.
//

import SwiftUI

struct AddProductForm: View {
    @State private var name = ""
    @State private var brand = ""
    @State private var use = ""
    @State private var useArea = ""
    @State private var productIngredientsInput = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var modelData: ModelData
    @State private var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            Section{
                NavigationStack{
                    ScrollView{
                        Text("Add Product Form")
                            .font(.title)
                        //form fields
                        VStack(spacing: 24){
                            InputView(text: $name,
                                      title: "Product Name",
                                      placeholder: "Moisturizing Shampoo Bar")
                            .autocorrectionDisabled(true)
                            
                            InputView(text:$brand,
                                      title:"Brand",
                                      placeholder: "Shampoorama"
                            )
                            .autocorrectionDisabled(true)
                            
                            InputView(text:$productIngredientsInput,
                                      title:"Product Ingredients",
                                      placeholder: "Please separate ingredients with a ,"
                            )
                            .autocorrectionDisabled(true)
                            InputView(text:$use,
                                      title:"Use",
                                      placeholder: "Ex: Shampoo,"
                            )
                            .autocorrectionDisabled(true)
                            InputView(text:$useArea,
                                      title:"Use Area",
                                      placeholder: "Ex: Hair,"
                            )
                            .autocorrectionDisabled(true)
                            
                            if isLoading == true {
                                ProgressView("Adding product to database.....")
                                    .padding()
                            } else {
                                Button{
                                    Task {
                                        await
                                        addProduct()
                                    }
                                } label: {
                                    HStack {
                                        Text("Add Product")
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
                        
                        
                        // signin button
                        
                        
                    }
                    
                }
                if isLoading{
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                    
                }
            }
        }
        
    }
    private func splitProductIngredientInput (_ productIngredients: String) -> [String] {
        let lowercaseIngredients = productIngredients.lowercased()
        let spacesRemovedIngredients = lowercaseIngredients.replacingOccurrences(of: " ", with: "")
        let ingredientsStringList : [String] = spacesRemovedIngredients.components(separatedBy: ",")
        
        return ingredientsStringList
    }
    
    
    
    
    private func findIngredientIds (ingredients:[Ingredient],  productIngredients: String) -> [String] {
        let productIngredientsStringList = splitProductIngredientInput(productIngredients)
        var productIngredientIds: [String] = []
        for productIngredient in productIngredientsStringList {
            for ingredient in ingredients {
                if ingredient.inputName == productIngredient {
                    let ingredientId = ingredient.id
                    productIngredientIds.append(ingredientId!)
                }
            }
        }
        return productIngredientIds
    }
    
    
    private func addProduct () async {
        guard !isLoading else { return }
        
        DispatchQueue.main.async {
            isLoading = true
        }
        
        let currentUser = modelData.authViewModel.currentUser
        let currentUserId = currentUser?.id
        let productIngredientsStrings = splitProductIngredientInput(productIngredientsInput)
        //        let productIngredientIds = findIngredientIds(ingredients:modelData.ingredientListViewModel.ingredientRepository.ingredients, productIngredients: productIngredientsInput)
        do {
            try await modelData.productListViewModel.addProduct(name:name,
                                                                brand: brand,
                                                                use: use,
                                                                useArea: useArea,
                                                                inputProductIngredients: productIngredientsStrings,
                                                                uploaderId: currentUserId!
            )
            
            isLoading = false
            name = ""
            brand = ""
            use = ""
            useArea = ""
            productIngredientsInput = ""
            dismiss()
        } catch {
            print("Failed to add product \(error.localizedDescription)")
            await MainActor.run {
            }
            
            
        }
        
    }
}

// MARK: AuthenticationFormProtocol

extension AddProductForm: ProductAuthenticationFormProtocol {
    var formIsValid: Bool {
        return !name.isEmpty
        && !productIngredientsInput.isEmpty
        && !brand.isEmpty
        && !use.isEmpty
        && !useArea.isEmpty
    }
}




struct AddProductForm_Previews: PreviewProvider {
    static var previews: some View {
        AddProductForm()
    }
}

