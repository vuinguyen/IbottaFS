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

class OfferCategoryViewController : UITableViewController, OfferAvailableViewControllerDelegate {
    
    var categories: [OfferCategory]?
    
    var delegate: OfferCategoryViewControllerDelegate?
    
    //required init?(coder aDecoder: NSCoder) {
        
    //    super.init(coder: aDecoder)
    //}
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        dispatch_async(queue) {
        
            self.categories = OfferCategoryManager.getCategoryArray()
        
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
            return 1
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
