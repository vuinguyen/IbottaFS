//
//  OfferCategoryViewController.swift
//  IbottaFS
//
//  Created by Vui Nguyen on 10/16/16.
//  Copyright © 2016 Sunfish Empire. All rights reserved.
//

import UIKit

class OfferCategoryViewController : UITableViewController {
    
    var categories: [String]
    
    required init?(coder aDecoder: NSCoder) {
        categories = OfferCategoryManager().getCategoryArray()
        
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
        return categories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("OfferCategoryItem", forIndexPath:  indexPath)
        
        let category = categories[indexPath.row]
        configureOfferForCell(cell, withCategory: category)
        
        return cell
    }
    
    func configureOfferForCell(cell: UITableViewCell, withCategory category: String) {
        let label = cell.viewWithTag(2000) as! UILabel
        label.text = category
    }
}
