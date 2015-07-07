//
//  NewTableViewController.swift
//  ACLifecycle_Swift
//
//  Created by Jeremy Chien on 2015/7/6.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class NewTableViewController: UITableViewController {
    
    

 
    @IBOutlet weak var PlusButton: UIButton!
    
    @IBOutlet weak var EditButton: UIButton!
    
    
    @IBOutlet var TimeTable: UITableView!
    
    
    var ListArray: NSArray = []
    var ArrayCounter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimeTable.dataSource = self
        TimeTable.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    @IBAction func PressPlus(sender: AnyObject) {
        
        /////擷取系統時間
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        let second = components.second
        //////
        
        
        
        func tableView(tableView: UITableView!, numberOfRowsInSection section:Int) -> Int {
            
            return ListArray.count
            
        }
        
        
        
        
        //填充UITableViewCell中文字標簽的值
        
        
        
        //ListArray += NSDate()
        
        
        ArrayCounter++
        
        
        
        
        ///self.detailViewController = (ACDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
        
    }
    
    //var counter: integer_t
    
    var counter = 0
    
    @IBAction func PressEdit(sender: AnyObject) {
        
        counter += 1
        
        if(counter%2 == 1)
        {
            EditButton.setTitle("Done", forState: .Normal)

        }
        
        else
        {
            EditButton.setTitle("Edit", forState: .Normal)

        }
        
        
    }
    
    
    /////////擷取系統時間
    
    var date = NSDate()
    var timeFormatter = NSDateFormatter()
    ///timeFormatter.dateFormat = "yyy-MM-dd 'at' HH:mm:ss.SSS"
    ///var strNowTime = timeFormatter.stringFromDate(date) as String
    
    
    ///////////////////

    
    /*override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
