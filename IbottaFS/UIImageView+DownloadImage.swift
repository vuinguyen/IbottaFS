//
//  UIImageView+DownloadImage.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/15/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

// This is a helper extension to make it easier and more performant to download images
extension UIImageView {
    func loadImageWithURL(url: NSURL) -> NSURLSessionDownloadTask {
        let session = NSURLSession.sharedSession()
        
        // Step 1: Start downloading image given image url
        let downloadTask = session.downloadTaskWithURL(url, completionHandler: { [weak self] url, response, error in
            
            // Step 2: check for errors
            if error == nil, let url = url,
                
            // Step 3: if no errors, save off data
            data = NSData(contentsOfURL: url), image = UIImage(data: data) {
                
                    // Step 4: update image
                    dispatch_async(dispatch_get_main_queue()) {
                        if let strongSelf = self {
                            strongSelf.image = image
                        }
                    }   // end dispatch_asynch(dispatch_get_main_queue)
            }   // end data = NDSData ..
        })  // end let downloadTask ..
        
        // 5: continue downloading
        downloadTask.resume()
        return downloadTask
        
    }   // end loadImageWithURL
}
