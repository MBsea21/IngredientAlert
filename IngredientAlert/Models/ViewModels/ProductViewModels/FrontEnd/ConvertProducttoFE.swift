//
//  ConvertProducttoFE.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/4/25.
//
func convertBEProductToFEProduct (BEProduct: ProductBE, ingredients: [Ingredient]) -> ProductFE {
    let FEID = BEProduct.id
    let name = BEProduct.name
    let brand = BEProduct.brand
    let use = BEProduct.use
    let useArea = BEProduct.useArea
    let productIngredients: [Ingredient] = []
    var flaggedIngredients: [Ingredient] = []
    var isFlagged: Bool?
    // find product ingredients
    for ingredientString in BEProduct.inputProductIngredients {
        var matchingIngredients: [Ingredient] {
            ingredients.filter{ (ingredient) -> Bool in
                return ingredient.inputName == ingredientString
            }
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
    }
        
    let productInstance = ProductFE(id: FEID,
                                        name: name,
                                        brand: brand,
                                        use: use,
                                        useArea: useArea,
                                        productIngredients: productIngredients,
                                        flaggedIngredients: flaggedIngredients,
                                        isFlagged: isFlagged)
        
    return productInstance
}


func convertBEProductsListToFE (BEProducts: [ProductBE], ingredients:[Ingredient]) -> [ProductFE] {
    var FEProducts: [ProductFE] = []
    for product in BEProducts {
        let productInstance = convertBEProductToFEProduct(BEProduct: product, ingredients: ingredients)
        FEProducts.append(productInstance)
    }
    return FEProducts
}
