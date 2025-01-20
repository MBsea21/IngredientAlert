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
            .frame(height: 300)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth:4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    ProductImage(image: Image("ceraVe.AcneFoamingCreamCleanser"))
}
