//
//  PersonalFlaggedListView.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/10/25.
//

import SwiftUI

struct PersonalFlaggedListWindow: View {
    @EnvironmentObject var modelData: ModelData
    @State private var searchText: String = ""
    @State private var showAllNames : Bool = false
    @State private var currentPage: Int = 0
    let pageSize = 10
    var flaggedList: [Ingredient]
    
    private func getCommonNameList (flaggedList: [Ingredient]) -> [Ingredient] {
        currentPage = 0
        return flaggedList.filter{ $0.isCommonName == true}
        
    }
    private func getFilteredList (textInput: String, flaggedList: [Ingredient]) -> [Ingredient] {
        let searchText =  textInput.lowercased().replacingOccurrences(of: " ", with: "")
        guard !searchText.isEmpty else { return flaggedList }
        
        return flaggedList.filter {
            $0.inputName.contains(searchText) || $0.commonName.contains(searchText)
        }
    }
    private func paginatedList(_ fullList: [Ingredient]) -> [Ingredient] {
        let startIndex = currentPage * pageSize
        let endIndex = min(startIndex + pageSize, fullList.count)
        return Array(fullList[startIndex..<endIndex])
    }
    
    
    var body: some View {
        VStack{
            Section{
                Section {
                    InputView(text:$searchText, title: "Search", placeholder: "Search userFlagged ingredients here...")
                        .autocorrectionDisabled(true)
                }
                if flaggedList.count == 0 {
                    Text("No flagged ingredients")
                }
                Toggle("Show All Names", isOn: $showAllNames)
                let filteredList = getFilteredList(textInput: searchText, flaggedList: flaggedList)
                let displayedList = showAllNames ? filteredList: getCommonNameList(flaggedList: filteredList)
                let pagedList = paginatedList(displayedList)
                PersonalFlaggedList(flaggedList: pagedList)
                    .environmentObject(modelData)
                
                HStack {
                    
                    Button("Previous") {
                        if currentPage > 0 { currentPage -= 1}
                        
                    }.disabled(currentPage==0)
                    Text("Page \(currentPage + 1) of \(max(1, (displayedList.count + pageSize - 1) / pageSize))")
                    
                    Button("Next") {
                        if (currentPage + 1 ) * pageSize < displayedList .count {
                            currentPage += 1
                        }
                    }
                    .disabled((currentPage + 1) * pageSize >= displayedList.count)
                    
                }
            }
            .padding()
        }
        
    }
}

