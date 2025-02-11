//
//  ConvertProducttoFE.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/4/25.
//
func convertBEProductToFEProduct (BEProduct: ProductBE, ingredientDict: [String: Ingredient], userFlaggedDict: [String: Ingredient]) -> ProductFE {
    let FEID = BEProduct.id
    let name = BEProduct.name
    let brand = BEProduct.brand
    let use = BEProduct.use
    let useArea = BEProduct.useArea
    let uploaderId = BEProduct.uploaderId
    var flaggedIngredients: [Ingredient] = []
    var unflaggedIngredients: [Ingredient] = []
    var userFlaggedIngredients: [Ingredient] = []
    var unaddedIngredients: [String] = []
    var isFlagged: Bool? = true
    
    
    for ingredientString in BEProduct.inputProductIngredients {
        
        if let ingredientData = ingredientDict[ingredientString] {
            if userFlaggedDict[ingredientData.inputName] != nil {
                userFlaggedIngredients.append(ingredientData)
            }
            if ingredientData.isFlagged == true {
                    flaggedIngredients.append(ingredientData)
            } else {
                unflaggedIngredients.append(ingredientData)
            }
        } else {
            unaddedIngredients.append(ingredientString)
            
        }
    }
        
        if flaggedIngredients != [] {
            isFlagged = true
        } else {
            isFlagged = false
        }

        let productInstance = ProductFE(id: FEID,
                                        name: name,
                                        brand: brand,
                                        use: use,
                                        useArea: useArea,
                                        productIngredients: BEProduct.inputProductIngredients,
                                        flaggedIngredients: flaggedIngredients,
                                        unflaggedIngredients: unflaggedIngredients,
                                        userFlaggedIngredients: userFlaggedIngredients,
                                        unaddedIngredients: unaddedIngredients ,
                                        isFlagged: isFlagged!,
                                        uploaderId: uploaderId)
        
        return productInstance
    }
    

func convertBEProductsListToFE (BEProducts: [ProductBE], ingredientDict:[String: Ingredient], userFlaggedDict: [String: Ingredient]) -> [ProductFE] {
        var FEProducts: [ProductFE] = []
        for product in BEProducts {
            let productInstance = convertBEProductToFEProduct(BEProduct: product, ingredientDict: ingredientDict, userFlaggedDict: userFlaggedDict)
            FEProducts.append(productInstance)
        }
        return FEProducts
    }
