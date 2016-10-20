//
//  OfferListViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/14/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

// This is the first screen of the app, it shows a checklist off all the offers that 
// the user selected

class OfferChecklistViewController: UITableViewController, OfferCategoryViewControllerDelegate {

    var items: [OfferItem] = [OfferItem]()
    var allRetailers: [Retailer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // When the app first loads, we're going to grab all the retailers and store that
        // off in RetailerManager, to be used later. We actually don't need to save it 
        // in this class, but it's nice to have. ;)
        // We also load the default, hardcoded data so the checklist has some to start,
        // and we refresh the table
         RetailerManager.getAllRetailersArray { (retailers) -> Void in
              self.allRetailers = retailers
              self.items = OfferChecklistManager.getDefaultOfferChecklist()
              self.tableView.reloadData()
          }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This gets called when a user adds an Offer from the Offer detail screen. We "roll back" the screens
    // to this one when that happens, and adds the newly selected offer to this checklist
    func offerCategoryViewControllerDelegate(controller: OfferCategoryViewController, didFinishAddingOffer offer: OfferItem) {
        print("in offerCategoryViewControllerDelegate")
        
        let newRowIndex = items.count
        items.append(offer)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        
        navigationController?.popToRootViewControllerAnimated(true)
    }

    // table specific functions: BEGIN
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("OfferChecklistItem", forIndexPath:  indexPath)
        
        let item = items[indexPath.row]
        configureOfferForCell(cell, withOfferItem: item)
        
        return cell
    }
    
    func configureOfferForCell(cell: UITableViewCell, withOfferItem item: OfferItem) {
        let offerLabel = cell.viewWithTag(1000) as! UILabel
        offerLabel.text = item.name
        
        let retailerLabel = cell.viewWithTag(5000) as! UILabel
       
        retailerLabel.text = "Available at: " + item.getRetailerString()
    }
    
    // this allows for deleting of rows
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath) {
        
        items.removeAtIndex(indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }    // table specific functions: END
    
    // There are two paths we could take once we're in the checklist screen.
    // Either, go to the detail screen for an offer (hence, segue.identifier == "OfferDetails"
    // or, if we click on the "+" sign, we go to the categories screen to help us start
    // selecting the next offer
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OfferDetails" {
            let controller = segue.destinationViewController as! OfferDetailViewController
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.offerDetailsToDisplay = items[indexPath.row]
            }
            
        }
        
        if segue.identifier == "OfferCategory" {
            let controller = segue.destinationViewController as! OfferCategoryViewController
            
            controller.delegate = self
        }
    }
    
}

