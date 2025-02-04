//
//  ConvertProducttoFE.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/4/25.
//

func convertProductToFE (BEProducts: [ProductBE], ingredients:[Ingredient]) -> [ProductFE] {
    var FEProducts: [ProductFE] = []
    for product in BEProducts {
        let FEID = product.id
        let name = product.name
        let brand = product.brand
        let use = product.use
        let useArea = product.useArea
        var productIngredients: [Ingredient] = []
        var flaggedIngredients: [Ingredient] = []
        var isFlagged: Bool?
        // find product ingredients
        for ingredientString in product.inputProductIngredients {
            var matchingIngredients: [Ingredient] {
                ingredients.filter{ (ingredient) -> Bool in
                    return ingredient.inputName == ingredientString
                }
            }
            productIngredients.append(contentsOf: matchingIngredients)
        }
        for ingredient in productIngredients {
            if ingredient.isFlagged {
                flaggedIngredients.append(ingredient)
            }
        }
        if flaggedIngredients != [] {
            isFlagged = true
        }else {
            isFlagged = false
        }
        
        let productInstance = ProductFE(id: FEID,
                                    name: name,
                                    brand: brand,
                                    use: use,
                                    useArea: useArea,
                                    productIngredients: productIngredients,
                                    flaggedIngredients: flaggedIngredients,
                                    isFlagged: isFlagged
        )
        FEProducts.append(productInstance)
    }
    return FEProducts
}

