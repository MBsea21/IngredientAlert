//
//  PersonalFlaggedListView.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/10/25.
//

import SwiftUI

struct PersonalFlaggedListWindow: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showAllNames : Bool = false
    var flaggedList: [Ingredient]
    
    private func getCommonNameList (flaggedList: [Ingredient]) -> [Ingredient] {
        var filteredList: [Ingredient] = []
        for ingredient in flaggedList {
            if ingredient.isCommonName == true {
                filteredList.append(ingredient)
            }
        }
        return filteredList
    }
    var body: some View {
        Toggle("Show All Names", isOn: $showAllNames)
        if showAllNames == false {
            let commonNameList = getCommonNameList(flaggedList: flaggedList)
            PersonalFlaggedList(flaggedList: commonNameList)
                .environmentObject(modelData)
        } else {
            PersonalFlaggedList(flaggedList:flaggedList)
                .environmentObject(modelData)
        }
    }
}
//
////            if showAllNames == false {
////                ForEach(flaggedList) { ingredient in
////                    HStack{
////                        if ingredient.isCommonName == true {
////                            Text(ingredient.commonName)
////                                .font(.subheadline)
////                            RemovePersonalFlaggedIngredientButtons(ingredient)
////                                .environmentObject(modelData)
////                            
////                        }
////                    }
////                }
////            } else {
////                ForEach(flaggedList) { ingredient in
////                    HStack{
////                        Text(ingredient.inputName)
////                            .font(.subheadline)
////                        RemovePersonalFlaggedIngredientButtons(ingredient)
////                            .environmentObject(modelData)
////                    }
////                }
////            }
//        }
//    }
//
