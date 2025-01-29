//
//  Account.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Account: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        if modelData.authViewModel.userSession != nil {
            AccountInfo()
                .environmentObject(modelData)
        } else {
            LoginFormView()
                .environmentObject(modelData)
        }
    }
}

#Preview {
    Account()
        .environmentObject(ModelData())
}
