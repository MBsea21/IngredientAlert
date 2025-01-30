//
//  IngredientDetail.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/15/25.
//
//import Foundation
//import SwiftUI
//
//struct IngredientDetail: View {
//    @EnvironmentObject var modelData: ModelData
//    var ingredient: Ingredient
//    
//    var ingredientIndex: Int{
//        modelData.ingredients.firstIndex(where: {$0.id == ingredient.id })!
//    }
//    
//
//    var body: some View {
//        @ObservedObject var modelData = modelData
//        
//        ScrollView{
//            VStack {
//                HStack {
//                    Text(ingredient.commonName)
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.center)
//                        .padding(.all, 1.0)
//                    if ingredient.isFlagged {
//                        Image(systemName: "flag.fill")
//                            .foregroundStyle(.red)
//                    }
//                }
//                
//                if ingredient.isFlagged {
//                    VStack{
//                        Section{
////                            if modelData.profile.personalFlaggedList.contains(ingredient) {
////                                Text("This ingredient is a user flagged ingredient!")
////                            }
//                        } .font(.callout)
//                            .fontWeight(.medium)
//                            .foregroundColor(Color.red)
//                            .padding(.all, 3.0)
//                            .padding(.bottom)
//                            .padding(.top)
//                        
//                        Section{
//                            Text("This ingredient has evidence of triggering a contact dermatitis reaciton.")
//
//                        }   .font(.callout)
//                            .fontWeight(.medium)
//                            .foregroundColor(Color.red)
//                            .padding(.all, 3.0)
//                            .padding(.bottom)
//                            .padding(.top)
//                        
//                        if ingredient.sourceUrl != "" {
//                            Section {
//                                Text("Reaction Evidence")
//                                    .font(.headline)
//                                    .padding(.top)
//                                Text(ingredient.sourceUrl)
//                                let sURL = URL(string: "\(ingredient.sourceUrl)")
//                                Link(destination: sURL!) {
//                                    Text("Click here to see article")}
//                            }
//                        }
//                        if ingredient.pubChemUrl != "" {
//                        Section{
//                            Text("Pub Chem Link")
//                                .font(.headline)
//                                .padding(.top)
//                            Text(ingredient.pubChemUrl)
//                            let PCURL = URL(string: "\(ingredient.pubChemUrl)")
//                            Link(destination: PCURL!) {
//                                Text("Click here to see Chemical Data")}
//                        }
//                        }
//                    }.padding()
//                    
//                }
////                if ingredient.otherNames != "" {
////                    Text("Other Names")
////                        .font(.headline)
////                        .padding(.top)
////                    Text(ingredient.otherNames)
////                        .padding(.bottom)
////                }
//                
//            }
//            
//        }
//        .navigationTitle(ingredient.inputName)
//            .navigationBarTitleDisplayMode(.inline)
//        }
//}
//
//#Preview {
//    let modelData = ModelData()
//    return IngredientDetail(ingredient: modelData.ingredients[7])
//        .environmentObject(modelData)
//}
