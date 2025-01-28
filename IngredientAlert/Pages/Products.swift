//
//  Products.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//

import SwiftUI

struct Products: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        ProductList()
            .environment(ModelData())
    }
}

#Preview {
    Products()
        .environment(ModelData())
}
