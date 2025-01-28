//
//  Account.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Account: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        AccountInfo()
            .environment(ModelData())
    }
}

#Preview {
    Account()
        .environment(ModelData())
}
