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
        AccountInfo()
            .environmentObject(modelData)
    }
}

#Preview {
    Account()
        .environmentObject(ModelData())
}
