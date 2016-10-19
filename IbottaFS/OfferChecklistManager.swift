//
//  OfferChecklistManager.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/18/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

class OfferChecklistManager {
    
    class func getDefaultOfferChecklist() -> [OfferItem] {
        var items = [OfferItem]()
        
        let row0item = OfferItem()
        row0item.id = 7533
        row0item.name = "One A DayÂ® Men's or Women's Multivitamin Tablets"
        row0item.description = "60 ct. or larger"
        row0item.url = "http://product-images.ibotta.com/offer/O1lEIO7SFwbJ2NRfAsicKA-normal.png"
        row0item.retailerIds = [3]
        row0item.retailerString = row0item.getRetailerString(withIds: row0item.retailerIds as! [Int])
        items.append(row0item)
        
        let row1item = OfferItem()
        row1item.id = 17573
        row1item.name = "LindsayÂ® Naturals California Ripe Olives"
        row1item.description = "Any variety - 3.8 - 6 oz. can"
        row1item.url = "http://product-images.ibotta.com/offer/hctk-9uRW09YKPBNmEZfnA-normal.png"
        row1item.retailerIds = [19]
        row1item.retailerString = row1item.getRetailerString(withIds: row1item.retailerIds as! [Int])
        items.append(row1item)
        
        let row2item = OfferItem()
        row2item.id = 18932
        row2item.name = "TysonÂ® All Natural Premium Cornish Hens"
        row2item.description = "48 oz. Twin Pack"
        row2item.url = "http://product-images.ibotta.com/offer/Ynm1jdu37TocxxabQmHW0g-normal.png"
        row2item.retailerIds = [4]
        row2item.retailerString = row2item.getRetailerString(withIds: row2item.retailerIds as! [Int])
        items.append(row2item)
        
        let row3item = OfferItem()
        row3item.id = 21270
        row3item.name = "TradewindsÂ® Jimmy Buffettâ€™s Island Tea"
        row3item.description = "Any variety - 18.5 oz. bottle"
        row3item.url = "http://product-images.ibotta.com/offer/qDbqnkwhgR16bCqwidUT4Q-normal.png"
        row3item.retailerIds = [8,
                                11,
                                19,
                                4,
                                37,
                                214,
                                218,
                                262,
                                23,
                                9,
                                24,
                                212,
                                31,
                                213,
                                7,
                                20,
                                2]
        row3item.retailerString = row3item.getRetailerString(withIds: row3item.retailerIds as! [Int])
        items.append(row3item)
        
        return items
    }
}