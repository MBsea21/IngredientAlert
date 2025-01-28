//
//  ProductImage.swift
//  IngredientAlert
//
//  Created by Madeline  Bennett on 1/16/25.
//
import SwiftUI

struct ProductImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 150)
            .scaledToFit()
            .cornerRadius(15)
    }
}

#Preview {
    ProductImage(image: Image("ceraVe.AcneFoamingCreamCleanser"))
}
