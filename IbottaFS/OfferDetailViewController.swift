//
//  OfferDetailViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/15/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import Foundation
import UIKit

protocol OfferDetailViewControllerDelegate {
    // keep popping views off the navcontroller stack and pass the OfferItem back to the checklist screen
    func offerDetailViewController(controller: OfferDetailViewController, didFinishAddingOffer offer: OfferItem)
}

// This screen provides the details for a user-selected offer

class OfferDetailViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    // If the user selects "Add", this function will start the process of popping the previous
    // screens off the stack to get back to the Offer checklist, and add this offer to the Offer checklist
    @IBAction func addOfferToList(sender: AnyObject) {
        print("add button pressed")
        delegate?.offerDetailViewController(self, didFinishAddingOffer: offerDetailsToDisplay!)
    }
    
    var downloadTask: NSURLSessionDownloadTask?
    
    var offerDetailsToDisplay: OfferItem?
    var addOffer: Bool?
    var delegate: OfferDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        if let item = offerDetailsToDisplay {
            print(item.name)
            print(item.id)
            print(item.retailerIds)
            
            nameLabel.text = item.name
            descriptionLabel.text = item.description
            //productImage.image = item.url   // this is a placholder until I can do better
            
            if let imageUrl = NSURL(string: item.url) {
                downloadTask = productImage.loadImageWithURL(imageUrl)
            }
        }
        
        // If we are on the path of selecting offers, then the user will see an
        // "Add" button in the detail screen. If we get to this detail screen from
        // the Offer checklist, then the "Add" button will not be enabled because
        // the offer has already been added to the checklist!
        if let addItem = addOffer {
            if (addItem == true) {
                addBarButton.enabled = true
            }
        }
        else {
            addBarButton.enabled = false
        }
    }
    
    // If the user selects "Retailers for this Offer", this will take them to the Retailer List
    // screen for that offer
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RetailerList" {
            
            let controller = segue.destinationViewController as! RetailerListViewController
            
            if offerDetailsToDisplay?.retailerIds != nil {
                controller.retailerIds = offerDetailsToDisplay!.retailerIds as? [Int]
            }
        }
    }
    
}
