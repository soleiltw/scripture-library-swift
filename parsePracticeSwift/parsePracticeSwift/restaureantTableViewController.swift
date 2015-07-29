//
//  restaureantTableViewController.swift
//  parsePracticeSwift
//
//  Created by Jeremy Chien on 2015/7/28.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class restaureantTableViewController: PFQueryTableViewController {
    
    override init(style: UITableViewStyle, className: String!)
    {
        super.init(style: style, className: className)
        
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        self.objectsPerPage = 25
        
        self.parseClassName = className
    }
    
    
    required init(coder aDecoder:NSCoder)  
    {
        fatalError("NSCoding not supported")  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func queryForTable() -> PFQuery {
        var query:PFQuery = PFQuery(className:self.parseClassName!)
        
        if(objects?.count == 0)
        {
            query.cachePolicy = PFCachePolicy.CacheThenNetwork
        }
        
        query.orderByAscending("resName")
        
        return query
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
        let cellIdentifier:String = "Cell"
        
        var cell:PFTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? PFTableViewCell
        
        if(cell == nil) {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        }
        
        if let pfObject = object {
            cell?.textLabel?.text = pfObject["resName"] as? String
        }
        
        return cell;
    }

}
