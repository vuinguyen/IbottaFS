//
//  RetailerListViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/19/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

class RetailerListViewController : UITableViewController {
    
    var retailerIds: [Int]?
    var retailers: [Retailer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if retailerIds != nil {
            print("in RetailerListViewController")
            print(retailerIds)
            
            let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
            dispatch_async(queue) {
            
                self.retailers = RetailerManager.getRetailersForIds(self.retailerIds!)
            
                for retailer in self.retailers! {
                    print(retailer.id)
                    print(retailer.name)
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            
            }   // end dispatch_async(queue)
        }   // end if retailerIds != nil
    }
    
    // table specific functions: BEGIN
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if retailers != nil {
            return retailers!.count
        }
        else {
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RetailerForOffer", forIndexPath:  indexPath)
        
        let retailer = retailers![indexPath.row]
        configureOfferForCell(cell, withRetailer: retailer)
        
        return cell
    }
    
    func configureOfferForCell(cell: UITableViewCell, withRetailer retailer: Retailer) {
        let label = cell.viewWithTag(4000) as! UILabel
        label.text = retailer.name
    }
    // table specific functions: END
}