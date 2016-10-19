//
//  OfferListViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/14/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

class OfferChecklistViewController: UITableViewController, OfferCategoryViewControllerDelegate {

    var items: [OfferItem]
    
    required init?(coder aDecoder: NSCoder) {
        
        items = OfferChecklistManager.getDefaultOfferChecklist()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.name
    }
    
    // this allows for deleting of rows
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath) {
        
        items.removeAtIndex(indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }    // table specific functions: END
    
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

