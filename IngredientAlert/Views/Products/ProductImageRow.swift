//
//  ProductImageRow.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/20/25.
//

import SwiftUI

struct ProductImageRow: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 50)
            .cornerRadius(15)
            .shadow(radius: 3)
            
    }
}

#Preview {
    ProductImageRow(image: Image("ceraVe.AcneFoamingCreamCleanser"))
}
