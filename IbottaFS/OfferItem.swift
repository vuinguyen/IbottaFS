//
//  OfferItem.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/15/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation


class OfferItem {
    //var categoryDictionary = OfferCategoryManager().categoryDictionary
    
    
    var id = 9999
    var name = "Awesome Product Name"
    var description = "Awesome Product Description"
    var url = "http://nerdapproved.com/wp-content/uploads/2015/07/everything-is-awesome.jpg"
    var retailerIds = []
    var retailerArray: [Retailer] = [Retailer]()
    var retailerString: String = ""
    
    func getRetailerString() -> String {
        
        if retailerArray.isEmpty  || retailerString.characters.count >= 1 {
            return retailerString
        }
        else {
            for retailer in retailerArray {
                retailerString.appendContentsOf(retailer.name)
                retailerString.appendContentsOf(", ")
            }
        }
        
        return retailerString
    }
    
    func getRetailerString(withIds ids: [Int]) -> String {
        
        if retailerIds.count >= 1 {
            retailerArray = RetailerManager.getRetailersForIds(retailerIds as! [Int])
            for retailer in retailerArray {
                retailerString.appendContentsOf(retailer.name)
                retailerString.appendContentsOf(", ")
            }
        }
        
        return retailerString
    }
    
    //var categories = [OfferCategoryManager.Category.Back2School,
    //                  OfferCategoryManager.Category.Beverages]
}