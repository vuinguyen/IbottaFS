//
//  OfferAvailableViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/17/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

protocol OfferAvailableViewControllerDelegate {
    // keep popping views off the navcontroller stack and pass the OfferItem back to the checklist screen
    func offerAvailableViewController(controller: OfferAvailableViewController, didFinishAddingOffer offer: OfferItem)
}

class OfferAvailableViewController : UITableViewController, OfferDetailViewControllerDelegate {
    
    var items: [OfferItem]?
    var offerCategory: OfferCategory?
    
    var delegate: OfferAvailableViewControllerDelegate?
    
    // Okay, so initialization from values that's NOT passed in from a seque
    // can happen in init, but if it's coming from a seque it should be in viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let category = offerCategory {
            print(category.name)
            OfferItemManager().getOffersForCategory(category) { (offerItemArray) -> Void in
                self.items = offerItemArray
                self.tableView.reloadData()
            }
        }
    }
    
    func offerDetailViewController(controller: OfferDetailViewController, didFinishAddingOffer offer: OfferItem) {
        print("in offerDetailViewController delegate")
        
       
        
        navigationController?.popViewControllerAnimated(true)
        delegate?.offerAvailableViewController(self, didFinishAddingOffer: offer)
       
    }
    
    // table specific functions: BEGIN
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items != nil {
            return (items?.count)!
        }
        else {
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("OfferAvailable", forIndexPath:  indexPath)
        
        if items != nil {
            let item = items![indexPath.row]
            configureOfferForCell(cell, withOfferItem: item)
        }
        return cell
    }
    
    func configureOfferForCell(cell: UITableViewCell, withOfferItem item: OfferItem) {
        let label = cell.viewWithTag(3000) as! UILabel
        label.text = item.name
    }
    // table specific functions: END
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OfferAdd" {
            let controller = segue.destinationViewController as! OfferDetailViewController
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.offerDetailsToDisplay = items![indexPath.row]
                controller.addOffer = true
                controller.delegate = self
            }
        }
    }
    
    
}
