//
//  OfferItem.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/15/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation


class OfferItem {
    
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
            var counter = 0
            for retailer in retailerArray {
                retailerString.appendContentsOf(retailer.name)
                if (counter < retailerArray.count - 1) {
                    retailerString.appendContentsOf(", ")
                }
                counter = counter + 1
            }
        }
        
        return retailerString
    }
    
    func getRetailerString(withIds ids: [Int]) -> String {
        
        if retailerIds.count >= 1 {
            retailerArray = RetailerManager.getRetailersForIds(retailerIds as! [Int])
            var counter = 0
            for retailer in retailerArray {
                retailerString.appendContentsOf(retailer.name)
                if (counter < retailerArray.count - 1) {
                    retailerString.appendContentsOf(", ")
                }
                counter = counter + 1
            }
           
        }
        
        return retailerString
    }
    
}