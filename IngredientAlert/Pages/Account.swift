//
//  Account.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Account: View {
    @EnvironmentObject var modelData: ModelData
    @State var isLoggedIn: Bool
    
    var body: some View {
        if isLoggedIn == true {
            AccountInfo(isLoggedIn: $isLoggedIn)
                .environmentObject(modelData)
        } else {
            LoginFormView(isLoggedIn: $isLoggedIn)
                .environmentObject(modelData)
        }
    }
}

//#Preview {
//    Account()
//        .environmentObject(ModelData())
//}
