//
//  RetailerManager.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/18/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

// This class manages data for retailers and the Retailer object
class RetailerManager {
    
    static let filename = "Retailers"
    
    // an array of all the possible Retailers
    static var allRetailersArray: [Retailer] = [Retailer]()
    
    
    // this function reads local JSON file and returns JSON in NSData format
    private static func readLocalJSONFile() -> NSData  {
        
        
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType:"json")
        let data = try! NSData(contentsOfFile:filePath!,
                               options: NSDataReadingOptions.DataReadingUncached)
        
        return data
    }
    
    // parse NSData (in JSON format) for retailer data into Retailer objects
    private static func parseDataForRetailers(data: NSData) -> [Retailer] {
        var retailersArray = [Retailer]()
        
        var json: [String: AnyObject]!
        
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String: AnyObject]
        } catch {
            print(error)
        }
        
        guard let array = json["retailers"] as? [AnyObject] else {
            print("Expected 'retailers' array")
            return retailersArray
        }
        
        var counter = 0
        var retailer: Retailer
        for resultDict in array {
            
            if let resultDict = resultDict as? [String: AnyObject] {
                
                retailer = Retailer()
                
                counter = counter + 1
                print("counter: \(counter)")
                
                print("retailer id: \(resultDict["id"])")
                print("retailer name: \(resultDict["name"])")
                
                if (resultDict["id"] as? Int) != nil {
                    retailer.id = resultDict["id"] as! Int
                }
                
                if (resultDict["name"] as? String) != nil {
                    retailer.name = resultDict["name"] as! String
                }   // end if resultDict["name"] not nil
                
                retailersArray.append(retailer)
                print("^^^^^^^^^^^^")
            }
            
        }
        
        return retailersArray
    }
    
    // Find all the Retailers from the JSON file
    // Then, update the UI (or whatever we want the completion handler to do)
    // with the Retailer array we found
    static func getAllRetailersArray(success:(allRetailersArray: [Retailer]) -> Void) -> Void {
        
        // read in local JSON file into an NSData object on a background thread
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
            
            let data = self.readLocalJSONFile()
            
            self.allRetailersArray = self.parseDataForRetailers(data)
            
            // parse NSData object into OfferItem objects (continue on background thread)
            
            // pass allRetailersArray into the completion handler, then
            // run completion handler to update table UI (update UI on main thread) or
            // whatever else we want to do on the main thread
            dispatch_async(dispatch_get_main_queue()) {
                success(allRetailersArray: self.allRetailersArray)
            }
        }   // end dispatch_async(queue)
    }
    
    // given an array of retailer id's, return an array of Retailer objects
    static func getRetailersForIds(retailerIds: [Int]) -> [Retailer] {
        var retailerArrayForId: [Retailer] = [Retailer]()
        
        var retailerItem: Retailer
        
        for retailerId in retailerIds.sort() {
            for retailer in self.allRetailersArray {
                if retailerId == retailer.id {
                    
                    retailerItem = Retailer()
                    retailerItem.id = retailer.id
                    retailerItem.name = retailer.name
                    
                    retailerArrayForId.append(retailerItem)
                    
                    
                    // if we found the retailer with that id, stop going through retailer array searching for that id!
                    break;
                }
            }
        }
        
        
        return retailerArrayForId
    }
    
    
}
