//
//  myTableViewController.swift
//  Kotel_Swift
//
//  Created by Jeremy Chien on 2015/7/14.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class myTableViewController: UITableViewController,HttpProtocol {
    
    var eHttp: HttpController = HttpController()
    var allData:Array<HotelSingle> = [] //存所有資料
    var selectedHotel:Int = 0 //使用者選取的旅館
    
    func didReceiveResults(results:NSArray) {
        //建立所有資料陣列
        for dict:AnyObject in results { //results 是 JSON 資料
            var hotelSingle = HotelSingle(dict: dict as! NSDictionary)
            allData.append(hotelSingle)
        }
        self.tableView.reloadData() //重新顯示資料
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eHttp.delegate = self //設定HttpController代理
        eHttp.onSearch("http://data.kaohsiung.gov.tw/Opendata/DownLoad.aspx?Type=2&CaseNo1=AV&CaseNo2=4&FileType=2&Lang=C&FolderType=O") //讀取JSON資料
    }
    
    //分區資料筆數
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    //顯示分區名稱及旅館數
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = (allData[indexPath.row].name as String)
        cell.detailTextLabel?.text = (allData[indexPath.row].address as String)
        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath {
        selectedHotel = indexPath.row
        return indexPath
    }
    
   override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
       var destViewController:secondViewController = segue!.destinationViewController as! secondViewController
        var hotelSingle = allData[selectedHotel]
        // secondViewController 是接受資料的class名稱
        destViewController.hotelName = hotelSingle.name  as String
        
       destViewController.hotelName = hotelSingle.name as String //送旅館名稱
        
    destViewController.hotelLocation = hotelSingle.address as NSString //傳送旅館地址*/
     destViewController.hotelRank = hotelSingle.rank as String
    destViewController.hotelPhone = hotelSingle.phone as String
    destViewController.hotelRoom = hotelSingle.room as String
    destViewController.hotelWeb = hotelSingle.web as String
    destViewController.hotelMail = hotelSingle.mail as String




    }
    
}
