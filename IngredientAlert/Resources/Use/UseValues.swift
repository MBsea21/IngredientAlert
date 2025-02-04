//
//  UseTitles.swift
//  IngredientAlert
//
//  Created by Madeline Bennett on 1/30/25.
//
//enum useArea : String, CaseIterable {
//    case Baby
//    case Body
//    case Teeth
//    case Face
//    case Hair
//    case Hand
//    case Household
//    case Eyes
//    case Eyebrows
//    case Lips
//    case Nails
//    case OralCare
//    case Pets
//    case Feet
//}

enum UseTitles : String, CaseIterable { // 1
    case Medication
    case AllinOneSoap
    case BabyPowder
    case BabyWipes
    case Cologne
    case Deodorant
    case Bronzer
    case BodyExfoliator
    case SkinProtectant
    case BodyOil
    case BabyMoisturizer
    case BubbleBath
    case BabySoap
    case BodySunscreenSPF
    case WetWipes
    case BathSalts
    case BodyScrub
    case BodyWash
    case BodyLotion
    case AntiPerspirant
    case LashandBrowSerum
    case EyeLiner
    case EyeSerum
    case Eyeshadow
    case EyeMask
    case Mascara
    case EyebrowPencilCreme
    case EyeCream
    case FaceMask
    case FaceSunscreen
    case CCCream
    case FaceCream
    case Concealer
    case AntiAgingTreatment
    case TintedMoisturizer
    case FaceOil
    case MakeupRemover
    case Blush
    case FaceLotion
    case Foundation
    case SettingPowderSpray
    case FaceCleaningWipes
    case FaceBalm
    case OilReducer
    case Toner
    case ExfoliationTreatment
    case SheetMask
    case FaceScrub
    case Serum
    case FaceCleanser
    case ShavingCream
    case AcneTreatment
    case Lotion
    case MiscSkinTreatment
    case Moisturizer
    case DailyMoisturizer
    case Oil
    case Cream
    case HairOil
    case Conditioner
    case HairMask
    case HairSerum
    case BabyShampoo
    case HairCream
    case Shampoo
    case Hairspray
    case HairDye
    case HairLightener
    case ShampooandConditioner
    case HandWash
    case HandLotion
    case HandSanitizer
    case HandBalm
    case AirFreshener
    case DishSoap
    case LaundryDetergent
    case HouseCleaner
    case OxygenBrightener
    case StainRemover
    case Lipstick
    case LipBalm
    case LipLiner
    case LipMaskandTreatment
    case Lipgloss
    case LipandCheekTint
    case NailVarnish
    case DentalProducts
    case PetWashandConditioner
}

//enum UseGroup: String, CaseIterable {
//    case Treatment
//    case AllinOneSoap
//    case BabyDiaperCare
//    case Perfume
//    case BodyOdor
//    case SunProducts
//    case Cleanser
//    case Moisturizer
//    case BabyMoisturizer
//    case Bath
//    case SunProtection
//    case Moisturizing
//    case Makeup
//    case HairRemoval
//    case ShampooandConditioner
//    case BabyShampoo
//    case Hairstyling
//    case HaiColor
//    case Sanitizer
//    case HouseholdGoods
//    case HouseholdCleaner
//    case NailCare
//    case OralCare
//    case PetGoods
//}

var UseTitleCaseDict = [ "Medication": "Medication",
                         "AllinOneSoap": "All in One Soap",
                         "BabyPowder": "Baby Powder",
                         "BabyWipes": "Baby Wipes",
                         "Cologne": "Cologne",
                         "Deodorant": "Deodorant",
                         "Bronzer": "Bronzer",
                         "BodyExfoliator": "Body Exfoliator",
                         "SkinProtectant": "Skin Protectant",
                         "BodyOil": "Body Oil",
                         "BabyMoisturizer": "Baby Moisturizer",
                         "BubbleBath": "Bubble Bath",
                         "BabySoap": "Baby Soap",
                         "BodySunscreenSPF": "Body Sunscreen (SPF)",
                         "WetWipes": "Wet Wipes",
                         "BathSalts": "Bath Salts",
                         "BodyScrub": "Body Scrub",
                         "BodyWash": "Body Wash",
                         "BodyLotion": "Body Lotion",
                         "AntiPerspirant": "Anti-Perspirant",
                         "LashandBrow Serum": "Lash & Brow Serum",
                         "EyeLiner": "Eye Liner",
                         "EyeSerum": "Eye Serum",
                         "Eyeshadow": "Eyeshadow",
                         "EyeMask": "Eye Mask",
                         "Mascara": "Mascara",
                         "EyebrowPencilCreme": "Eyebrow Pencil/Creme",
                         "EyeCream": "Eye Cream",
                         "FaceMask": "Face Mask",
                         "FaceSunscreen": "Face Sunscreen (SPF)",
                         "CCCream": "CC Cream",
                         "FaceCream": "Face Cream",
                         "Concealer": "Concealer",
                         "AntiAgingTreatment": "Anti-Aging Treatment",
                         "TintedMoisturizer": "Tinted Moisturizer",
                         "FaceOil": "Face Oil",
                         "MakeupRemover": "Makeup Remover",
                         "Blush": "Blush",
                         "FaceLotion": "Face Lotion",
                         "Foundation": "Foundation",
                         "SettingPowderSpray": "Setting Powder/Spray",
                         "FaceCleaningWipes": "Face Cleaning Wipes",
                         "FaceBalm": "Face Balm",
                         "OilReducer": "Oil Reducer",
                         "Toner": "Toner",
                         "ExfoliationTreatment": "Exfoliation Treatment",
                         "SheetMask": "Sheet Mask",
                         "FaceScrub": "Face Scrub",
                         "Serum": "Serum",
                         "FaceCleanser": "Face Cleanser",
                         "ShavingCream": "Shaving Cream",
                         "AcneTreatment": "Acne Treatment",
                         "Lotion": "Lotion",
                         "MiscSkinTreatment": "Misc Skin Treatment",
                         "Moisturizer": "Moisturizer",
                         "DailyMoisturizer": "Daily Moisturizer",
                         "Oil": "Oil",
                         "Cream": "Cream",
                         "HairOil": "Hair Oil",
                         "Conditioner": "Conditioner",
                         "HairMask": "Hair Mask",
                         "HairSerum": "Hair Serum",
                         "BabyShampoo": "Baby Shampoo",
                         "HairCream": "Hair Cream",
                         "Shampoo": "Shampoo",
                         "Hairspray": "Hairspray",
                         "HairDye": "Hair Dye",
                         "HairLightener": "Hair Lightener",
                         "ShampooandConditioner": "Shampoo & Conditioner",
                         "HandWash": "Hand Wash",
                         "HandLotion": "Hand Lotion",
                         "HandSanitizer": "Hand Sanitizer",
                         "HandBalm": "Hand Balm",
                         "AirFreshener": "Air Freshener",
                         "DishSoap": "Dish Soap",
                         "LaundryDetergent": "Laundry Detergent",
                         "HouseCleaner": "House Cleaner",
                         "OxygenBrightener": "Oxygen Brightener",
                         "StainRemover": "Stain Remover",
                         "Lipstick": "Lipstick",
                         "LipBalm": "Lip Balm",
                         "LipLiner": "Lip Liner",
                         "LipMaskandTreatment": "Lip Mask / Treatment",
                         "Lipgloss": "Lipgloss",
                         "LipandCheekTint": "Lip & Cheek Tint",
                         "NailVarnish": "Nail Varnish",
                         "DentalProducts": "Dental Products",
                         "PetWashandConditioner": "Pet Wash & Conditioner"
]



//let useGroupDictionary = ["Treatment": "Treatment",
//                          "AllinOneSoap": "All in One Soap",
//                          "BabyDiaperCare": "Baby Diaper Care",
//                          "Perfume": "Perfume",
//                          "BodyOdor": "Body Odor",
//                          "SunProducts": "Sun Products",
//                          "Cleanser": "Cleanser",
//                          "Moisturizer": "Moisturizer",
//                          "BabyMoisturizer": "Baby Moisturizer",
//                          "Bath": "Bath",
//                          "SunProtection": "Sun Protection",
//                          "Moisturizing": "Moisturizing",
//                          "Makeup": "Makeup",
//                          "HairRemoval": "Hair Removal",
//                          "ShampooandConditioner": "Shampoo and Conditioner",
//                          "BabyShampoo": "Baby Shampoo",
//                          "Hairstyling": "Hairstyling",
//                          "HaiColor": "Hair Color",
//                          "Sanitizer": "Sanitizer",
//                          "HouseholdGoods": "Household Goods",
//                          "HouseholdCleaner": "Household Cleaner",
//                          "NailCare": "Nail Care",
//                          "OralCare": "Oral Care",
//                          "PetGoods": "Pet Goods",
//                      ]
//
//    
//let useAreaDictionary = ["Baby": "Baby",
//                         "Body": "Body",
//                         "Eyes & Eyebrows": "Teeth",
//                         "Face": "Face",
//                         "Face, Body": "Hair",
//                         "Face, Body, Hands": "Hand",
//                         "Hair": "Household",
//                         "Hand": "Eyes",
//                         "Household": "Eyebrows",
//                         "Lips": "Lips",
//                         "Lips, Face": "Nails",
//                         "Nails": "OralCare",
//                         "Oral Care": "Pets",
//                         "Pets": "Feet"
//]










                























































































































































































































































































































































































































































































































































































































































































































































































































































































































































