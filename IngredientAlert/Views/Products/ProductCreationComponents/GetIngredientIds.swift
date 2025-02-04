//
//  GetIngredientIds.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//

func getIngedientsFromIds(_ productIngredientIds : [String], ingredients: [Ingredient]) -> [Ingredient] {
    var productIngredientsList: [Ingredient] = []
    
    for productingredientid in productIngredientIds {
        var matchingIngredients:[Ingredient] {
            ingredients.filter{ (ingredient) -> Bool in
                return ingredient.id == productingredientid}
        }
        for matchingIngredient in matchingIngredients {
            productIngredientsList.append(matchingIngredient)
        }
    }
    return productIngredientsList
    
}

