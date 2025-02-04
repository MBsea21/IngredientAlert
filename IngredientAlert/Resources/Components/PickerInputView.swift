////
////  PickerinputView.swift
////  IngredientAlert
////
////  Created by Madeline Bennett on 2/2/25.
////
//
//
////  UseGroups.swift
////  IngredientAlert
////
////  Created by Madeline Bennett on 1/30/25.
////
//import SwiftUI
//
//struct PickerInputView: View {
//    @Binding var text: String
//    let enumSelection: [String]
//    let selectionTitleDictionary: [String: String]
//    let title: String
//    let placeHolder: String
//    
//    //    var filteredGroups : [String]
//    
//    
//    var body: some View {
//        InputView(text: $text, title: title, placeholder: placeHolder)
//            .padding()
//        
//        //        List{
//        //            @State var useGroupSelected: Bool = false
//        //            Toggle(UseTitle, isOn :$useGroupSelected)
//        //        }
//        
//        Picker (title, selection: enumSelection) {
//            ForEach(enumSelection.allCases, id: \.self) {item in
//                let enumTitleString = selectionTitleDictionary[item.rawValue]
//                Text(verbatim:enumTitleString ?? "")
//            }
//            .padding()
//            
//            Spacer()
//            
//        }.padding()
//        
//        
//    }
////        private func filterUseGroups() {
////           for useTitle in UseTitles.allCases {
////                if useTitle.rawValue contains  typedUseGroupInput {
////                    selectedUseGroup.append(useTitle.rawValue)
////               }
////            }
////       }
//    //    }
//    
//}
//
//#Preview {
//    @State var test = ""
//    enum testTitles: String, CaseIterable {
//    case one
//    case two
//    case three
//    case four
//    case five
//    case six
//    }
//        
//    let testdict = [
//        "one" : "One",
//        "two" : "Two",
//        "three" : "Three",
//        "four" : "Four",
//        "five" : "Five",
//        "six" : "Six",
//    ]
//    PickerInputView(text: $test,
//                    enumSelection: testTitles,
//                    selectionTitleDictionary: testdict,
//                    title: "Test picker",
//                    placeHolder: "test placeholder"
//    )
//}
////
//
