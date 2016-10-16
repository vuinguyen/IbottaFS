//
//  OfferDetailViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/15/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

class OfferDetailViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var downloadTask: NSURLSessionDownloadTask?
    
    var offerDetailsToDisplay: OfferItem?
    
    override func viewDidLoad() {
        if let item = offerDetailsToDisplay {
            print(item.name)
            print(item.id)
            
            nameLabel.text = item.name
            descriptionLabel.text = item.description
            //productImage.image = item.url   // this is a placholder until I can do better
            
            if let imageUrl = NSURL(string: item.url) {
                downloadTask = productImage.loadImageWithURL(imageUrl)
                //productImage.image = UIImage(data: downloadTask)
            }
            
        }
    }
    
    
    
}
