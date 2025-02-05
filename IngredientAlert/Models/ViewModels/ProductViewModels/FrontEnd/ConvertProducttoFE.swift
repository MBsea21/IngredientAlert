//
//  ConvertProducttoFE.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 2/4/25.
//
func convertBEProductToFEProduct (BEProduct: ProductBE, ingredientDict: [String: Ingredient]) -> ProductFE {
    let FEID = BEProduct.id
    let name = BEProduct.name
    let brand = BEProduct.brand
    let use = BEProduct.use
    let useArea = BEProduct.useArea
    let uploaderId = BEProduct.uploaderId
    var flaggedIngredients: [Ingredient] = []
    var unflaggedIngredients: [Ingredient] = []
    var unaddedIngredients: [String] = []
    var isFlagged: Bool? = true
    
    // find product ingredients
    print("BE Input Products: \(BEProduct.inputProductIngredients)")
    print("Ingredient Dictionary \(ingredientDict)")
    for ingredientString in BEProduct.inputProductIngredients {
        print("ingredientString: \(ingredientString)")
        if let ingredientData = ingredientDict[ingredientString] {
            print("Ingredient Data: \(ingredientData)")
            if ingredientData.isFlagged == true {
                flaggedIngredients.append(ingredientData)
            } else {
                print("Ingredient not found in dictionary")
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
     print("line 39: flagged ingredients \(flaggedIngredients)")

        let productInstance = ProductFE(id: FEID,
                                        name: name,
                                        brand: brand,
                                        use: use,
                                        useArea: useArea,
                                        productIngredients: BEProduct.inputProductIngredients,
                                        flaggedIngredients: flaggedIngredients,
                                        unflaggedIngredients: unflaggedIngredients,
                                        unaddedIngredients: unaddedIngredients ,
                                        isFlagged: isFlagged!,
                                        uploaderId: uploaderId)
        
        return productInstance
    }
    

    func convertBEProductsListToFE (BEProducts: [ProductBE], ingredientDict:[String: Ingredient]) -> [ProductFE] {
        var FEProducts: [ProductFE] = []
        for product in BEProducts {
            let productInstance = convertBEProductToFEProduct(BEProduct: product, ingredientDict: ingredientDict)
            FEProducts.append(productInstance)
        }
        return FEProducts
    }
