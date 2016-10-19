//
//  RetailerManager.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/18/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

class RetailerManager {
    
    let filename = "Retailers"
    var retailerDict: [Int: String] = [Int: String]()
    
    // our goal is to parse the Retailers json into this dictionary, so it is easy to fill the
    // Retailer array in OfferItem
    
    // this function reads local JSON file and returns JSON in NSData format
    func readLocalJSONFile(filename: String) -> NSData  {
        
        
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType:"json")
        let data = try! NSData(contentsOfFile:filePath!,
                               options: NSDataReadingOptions.DataReadingUncached)
        
        return data
    }

    
    
    
    
}