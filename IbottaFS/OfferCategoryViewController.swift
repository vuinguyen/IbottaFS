//
//  OfferCategoryViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/16/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

protocol  OfferCategoryViewControllerDelegate {
    // keep popping views off the navcontroller stack and pass the OfferItem back to the checklist screen
    func offerCategoryViewControllerDelegate(controller: OfferCategoryViewController, didFinishAddingOffer offer: OfferItem)
}

// This screen displays all the possible categories for the offers. This way, the user can 
// narrow down what offers they want to see by selecting the category in this screen
class OfferCategoryViewController : UITableViewController, OfferAvailableViewControllerDelegate {
    
    var categories: [OfferCategory]?
    
    var delegate: OfferCategoryViewControllerDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
         // Call default categories that were hardcoded before
         // Now, we dynamically get all the categories from the JSON file, hence 
         // this section of code is commented out but left here for historical reasons
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
        
            self.categories = OfferCategoryManager.getCategoryArray()
        
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
         */
        
        // We grab all the categories from the JSON file and update the table
        OfferCategoryManager.getAllCategoriesArray() { (categoriesArray) -> Void in
            self.categories = categoriesArray
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // This gets called when a user selects "Add" from the Offer detail screen. We "roll back" the screens
    // to the Offer checklist when that happens, and continue passing the newly selected offer back to the
    // Offer checklist so that the offer can be added there and the checklist updated
    func offerAvailableViewController(controller: OfferAvailableViewController, didFinishAddingOffer offer: OfferItem) {
        
        print("in offerAvailableViewController delegate")
        
        navigationController?.popViewControllerAnimated(true)
        
        delegate?.offerCategoryViewControllerDelegate(self, didFinishAddingOffer: offer)
        
    }
    
    // table specific functions: BEGIN
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categories != nil {
            return categories!.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("OfferCategoryItem", forIndexPath:  indexPath)
        
        let category = categories![indexPath.row]
        configureOfferForCell(cell, withCategory: category)
        
        return cell
    }
    
    func configureOfferForCell(cell: UITableViewCell, withCategory category: OfferCategory) {
        let label = cell.viewWithTag(2000) as! UILabel
        label.text = category.name
    }
    // table specific functions: END
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OfferAvailable" {
            let controller = segue.destinationViewController as! OfferAvailableViewController
            
            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
                controller.offerCategory = categories![indexPath.row]
                controller.delegate = self
            }
            
        }
    }}
