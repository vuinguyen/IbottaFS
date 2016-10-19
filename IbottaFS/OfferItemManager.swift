//
//  OfferItemManager.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/17/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation

class OfferItemManager {
    
    let filename = "Offers"

    
    
    // this function reads local JSON file and returns JSON in NSData format
    func readLocalJSONFile(filename: String) -> NSData  {
        
            
            let filePath = NSBundle.mainBundle().pathForResource(filename, ofType:"json")
            let data = try! NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached)
            
            return data
    }
    
    
    
    // parse NSData (in JSON format) by category into OfferItem objects
        func parseDataForCategory(data: NSData, offerCategory: String) -> [OfferItem] {
            
            var offerItemArray = [OfferItem]()
            
            var json: [String: AnyObject]!
        
            do {
                json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String: AnyObject]
            } catch {
                print(error)
            }
        
        //print(json)
        guard let array = json["offers"] as? [AnyObject] else {
            print("Expected 'results' array")
            return offerItemArray
        }
        //print(array[0])
        
        var counter = 0
        var offerItem: OfferItem
        for resultDict in array
        {
            if let resultDict = resultDict as? [String: AnyObject] {
                
                
                if let categoryArray = resultDict["categories"] as? [[String: AnyObject]] {
                    //print(categoryArray[0]["name"])
                    offerItem = OfferItem()
                    for category in categoryArray {
                        if (category["name"] as! String) == offerCategory {
                            
                            
                            counter = counter + 1
                            print("counter: \(counter)")
                            
                            print("id: \(resultDict["id"])")
                            print("name: \(resultDict["name"])")
                            print("retailers: \(resultDict["retailers"])")
                            print("description: \(resultDict["description"])")
                            print("url: \(resultDict["url"])")
                            
                            if (resultDict["id"] as? Int) != nil {
                                offerItem.id = resultDict["id"] as! Int
                            }
                            
                            if (resultDict["name"] as? String) != nil {
                                offerItem.name = resultDict["name"] as! String
                            }   // end if resultDict["name"] not nil
                            
                            
                            if (resultDict["description"] as? String) != nil {
                                offerItem.description = resultDict["description"] as! String
                            }
 
                            
                            if (resultDict["url"] as? String)  != nil {
                                offerItem.url = resultDict["url"] as! String
                                
                            }
                            
                            if (resultDict["retailers"] as? [Int]) != nil {
                                offerItem.retailerIds = resultDict["retailers"] as! [Int]
                            }
                            
                            // add offerItem after all valid values are set
                            offerItemArray.append(offerItem)
                            // print(resultDict)
                            print("^^^^^^^^^^^^^^^^")
                        } // if category == offerCategory
                        
                        
                    }   // for category in categoryArray
                    
                    
                   
                } //let categoryArray = resultDict
                
            }   // resultDict = resultDict
            
        }   // end for resultDict in array
        
        return offerItemArray
    }   // end of parseDataForCategory function


    // let's also pass in a completion handler to update the UI table, and return
    // an array of OfferItem's
    internal func getOffersForCategory(offerCategory: String, success:((offerItemArray: [OfferItem]) -> Void)) -> Void {
    
        var offerItemArray: [OfferItem] = []
        //print("called getOffersForCategory")
        
        //parseJSONFileForCategory(data, offerCategory)
        
        // read in local JSON file into an NSData object on a background thread
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
            
            let data = self.readLocalJSONFile(self.filename)
            
            offerItemArray = self.parseDataForCategory(data, offerCategory: offerCategory)
            
            // parse NSData object into OfferItem objects (continue on background thread)
            
            
            // run completion handler to update table UI (update UI on main thread)
            dispatch_async(dispatch_get_main_queue()) {
                success(offerItemArray: offerItemArray)
            }
        }
        
        
       // return offerItemArray
      
    }   // end getOffersForCategory



}