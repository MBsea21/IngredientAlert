//
//  ConfirmChoice.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/8/25.
//
import SwiftUI

struct ConfirmChoice : View {
    @State private var confirmationText: String = ""
    var body: some View {
        InputView(text:$confirmationText, title: "Confirm Deletion", placeholder: "type Confirm to delete" )
    }
}
