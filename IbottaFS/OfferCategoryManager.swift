//
//  OfferCategoryManager.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/15/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

class OfferCategoryManager {
    
    var categorySet: Set<String> = [
        "Personal Care",
        "Health",
        "Condiments",
        "Canned Goods",
        "Frozen",
        "Beverages",
        "Back 2 School"
                                    ]
    
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
    internal func getCategorySet() -> Set<String> {
        return categorySet
    }
    
    internal func getCategoryArray() -> [String] {
        var categoryArray = [String]()
        for category in categorySet.sort() {
            categoryArray.append(category)
        }
        return categoryArray
    }
}