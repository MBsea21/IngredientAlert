//
//  UseGroups.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//
import SwiftUI

struct UseInput: View {
    @State private var selectedUseTitle: [String] = []
//    @State private var typedUseTitleInput: String = ""
//    var filteredGroups : [String]
    
    
    var body: some View {
//        InputView(text: $typedUseTitleInput, title: "Use Type", placeholder: "e.g. Moisturizer")
//            .padding()
        
        //        List{
        //            @State var useGroupSelected: Bool = false
        //            Toggle(UseTitle, isOn :$useGroupSelected)
        //        }
        
        Picker ("Use Type", selection: $selectedUseTitle) {
            ForEach(UseTitles.allCases, id: \.self) {item in
                let useTitleString = UseTitleCaseDict[item.rawValue]
                Text(verbatim:useTitleString ?? "")
            }
            .padding()
            
            Spacer()
            
            Section {
                Text ("Hi there \(selectedUseTitle)")
            }
            
            
        }.padding()
        
        
    }
//        private func filterUseGroups() {
//           for useTitle in UseTitles.allCases {
//                if useTitle.rawValue contains  typedUseGroupInput {
//                    selectedUseGroup.append(useTitle.rawValue)
//               }
//            }
//       }
    //    }
    
}

#Preview {
    UseInput()
}
//

