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
    func offerDetailViewController(controller: OfferDetailViewController, didFinishAddingOffer offer: OfferItem)
}

class OfferDetailViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
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
        
        if let addItem = addOffer {
            if (addItem == true) {
                addBarButton.enabled = true
            }
        }
        else {
            addBarButton.enabled = false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RetailerList" {
            
            let controller = segue.destinationViewController as! RetailerListViewController
            
            if offerDetailsToDisplay?.retailerIds != nil {
                controller.retailerIds = offerDetailsToDisplay!.retailerIds as? [Int]
            }
        }
    }
    
}
