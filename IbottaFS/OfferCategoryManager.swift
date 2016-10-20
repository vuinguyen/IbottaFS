//
//  OfferCategoryManager.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/15/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

// This class manages categories and the OfferCategory object
class OfferCategoryManager {
    
    static let filename = "Offers"
    
    // Functions and data for intial development: BEGIN
    
    // this was the "test" category set for initial development
    // but now we parse the category data from the JSON file
    static var categorySet: Set<OfferCategory> = [
        OfferCategory("Personal Care"),
        OfferCategory("Health"),
        OfferCategory("Condiments"),
        OfferCategory("Canned Goods"),
        OfferCategory("Frozen"),
        OfferCategory("Beverages"),
        OfferCategory("Back 2 School")
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
    // Functions and data for initial development: END
    
    // Everything after this is for the current development, grabbing 
    // categories dynamically from the JSON file instead of displaying hardcode data
    
    static var allCategoriesSet: Set<OfferCategory> = Set<OfferCategory>()
    
    static var allCategoriesArray: [OfferCategory] = [OfferCategory]()
    
    // this function reads local JSON file and returns JSON in NSData format
    private static func readLocalJSONFile() -> NSData  {
        
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType:"json")
        let data = try! NSData(contentsOfFile:filePath!,
                               options: NSDataReadingOptions.DataReadingUncached)
        
        return data
    }
    
    // parse NSData (in JSON format) for category data into OfferCategory objects
    private static func parseDataForCategories(data: NSData) -> [OfferCategory] {
        
        var offerCategoryArray = [OfferCategory]()
        
        var json: [String: AnyObject]!
        
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String: AnyObject]
        } catch {
            print(error)
        }
        
        //print(json)
        guard let array = json["offers"] as? [AnyObject] else {
            print("Expected 'offers' array")
            return offerCategoryArray
        }
        //print(array[0])
        
        //var offerCategory: OfferCategory
        for resultDict in array {
            
            if let resultDict = resultDict as? [String: AnyObject] {
                
                if let categoryArray = resultDict["categories"] as? [[String: AnyObject]] {
                    
                    for category in categoryArray {
                        
                        if (category["name"] != nil) {
                            allCategoriesSet.insert(OfferCategory((category["name"] as? String)!))
                        }
                    }   // end for category in categoryArray
                    
                }   // end if let categoryArray
            }
        }   // end for resultDict in array
        
        print("in OfferCategoryManager")
        
        for category in allCategoriesSet {
            print("category: \(category)")
            offerCategoryArray.append(category)
        }
        
        return offerCategoryArray
    }
    
    // Grab all the possible categories from the JSON file and then run the completion
    // handler on our category data
    static func getAllCategoriesArray(success:(allCategoriesArray: [OfferCategory]) -> Void) -> Void {
        
        // read in local JSON file into an NSData object on a background thread
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
            
            if (allCategoriesArray.isEmpty) {
            
                let data = self.readLocalJSONFile()
            
                self.allCategoriesArray = self.parseDataForCategories(data)
            }
            
            // parse NSData object into OfferItem objects (continue on background thread)
            
            // pass allRetailersArray into the completion handler, then
            // run completion handler to update table UI (update UI on main thread) or
            // whatever else we want to do on the main thread
            dispatch_async(dispatch_get_main_queue()) {
                success(allCategoriesArray: self.allCategoriesArray)
            }
        }   // end dispatch_async(queue)
    }
    
}
