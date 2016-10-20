//
//  OfferCategory.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/19/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation


func == (lhs: OfferCategory, rhs: OfferCategory) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

// This class represents a category that an offer could belong to
// i.e. Health, Beverages, etc.

// Made the OfferCategory class "hashable" so that we can use 
// the Set collection type on it (see "OfferCategoryManager.swift")
class OfferCategory : Hashable {
    
    var name: String = "some category"
    
    init() {
        
    }
    
    init(_ inputName: String) {
        name = inputName
    }
    
    var hashValue: Int {
        get {
            return name.capitalizedString.hashValue
        }
    }
    
}
