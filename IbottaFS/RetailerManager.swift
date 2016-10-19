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
    
    // a dictionary of all the possible retailers
    var allRetailersDictionary: [Int: String] = [Int: String]()
    
    // our goal is to parse the Retailers json into this dictionary, so it is easy to fill the
    // Retailer array in OfferItem
    
    // this function reads local JSON file and returns JSON in NSData format
    private func readLocalJSONFile() -> NSData  {
        
        
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType:"json")
        let data = try! NSData(contentsOfFile:filePath!,
                               options: NSDataReadingOptions.DataReadingUncached)
        
        return data
    }
    
    // return a dictionary of all the Retailers and their ids
    func getAllRetailersDictionary() -> [Int: String] {
        
        if (allRetailersDictionary.isEmpty) {
            
        }
        
        return allRetailersDictionary
    }
    

    // given an array of retailer id's, return a dictionary with ids and their strings
    func getRetailerDictionary(retailerIds: [Int]) -> [Int: String] {
        let retailerDictForIds: [Int: String] = [Int: String]()
        
        return retailerDictForIds
    }
    
    // given an array of retailer id's, return an array of corresponding strings
    func RetailerStrings(retailerIds: [Int]) -> [String] {
        let retailerStrings: [String] = []
        return retailerStrings
    }
    
}