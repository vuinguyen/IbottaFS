//
//  OfferCategoryManager.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/15/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

class OfferCategoryManager {
    
    static var categorySet: Set<OfferCategory> = [
        OfferCategory("Personal Care"),
        OfferCategory("Health"),
        OfferCategory("Condiments"),
        OfferCategory("Canned Goods"),
        OfferCategory("Frozen"),
        OfferCategory("Beverages"),
        OfferCategory("Back 2 School")
    ]
    
    static var allCategoriesArray: [OfferCategory] = [OfferCategory]()
    
    enum Category: String {
        case PersonalCare = "Personal Care"
        case Health = "Health"
        case Condiments = "Condiments"
        case CannedGoods = "Canned Goods"
        case Frozen = "Frozen"
        case Beverages = "Beverages"
        case Back2School = "Back 2 School"
        
    }
    
    var categoryDictionary: [String: String] = [
                                                    "PersonalCare": "Personal Care",
                                                    "Health": "Health",
                                                    "Condiments": "Condiments",
                                                    "CannedGoods": "Canned Goods",
                                                    "Frozen": "Frozen",
                                                    "Beverages": "Beverages",
                                                    "Back2School": "Back 2 School"

                                                ]
    static func getCategorySet() -> Set<OfferCategory> {
        return categorySet
    }
    
    static func getCategoryArray() -> [OfferCategory] {
        var categoryArray = [OfferCategory]()
        for category in categorySet {
            categoryArray.append(category)
        }
        return categoryArray
    }
    
    static func getAllCategoriesArray(success:(allCategoriesArray: [OfferCategory]) -> Void) -> Void {
        
    }
    
}