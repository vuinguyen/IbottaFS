//
//  OfferListViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/14/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

class OfferChecklistViewController: UITableViewController {

    var items: [OfferItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [OfferItem]()
        
        let row0item = OfferItem()
        row0item.id = 7533
        row0item.name = "One A DayÂ® Men's or Women's Multivitamin Tablets"
        items.append(row0item)
        
        let row1item = OfferItem()
        row1item.id = 17573
        row1item.name = "LindsayÂ® Naturals California Ripe Olives"
        items.append(row1item)
        
        let row2item = OfferItem()
        row2item.id = 18932
        row2item.name = "TysonÂ® All Natural Premium Cornish Hens"
        items.append(row2item)
        
        let row3item = OfferItem()
        row3item.id = 21270
        row3item.name = "TradewindsÂ® Jimmy Buffettâ€™s Island Tea"
        items.append(row3item)
        
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
    
    // table specific functions: END
    func configureOfferForCell(cell: UITableViewCell, withOfferItem item: OfferItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.name
    }
    
    
}

