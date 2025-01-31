//
//  paragraphFunction.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/22/25.
//
//
func ingredientParagraphFunction (_ ingredients:[Ingredient]) -> String {
    
    var string = ""
    for ingredient in ingredients {
        let ingredientName = ingredient.inputName
        if ingredient.id == ingredients[0].id {
            string.append(ingredientName)
        } else {
            string.append(", \(ingredientName)")
        }
    }
    return string
}
