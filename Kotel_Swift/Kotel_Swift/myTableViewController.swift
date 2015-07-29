//
//  myTableViewController.swift
//  Kotel_Swift
//
//  Created by Jeremy Chien on 2015/7/14.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class myTableViewController: UITableViewController ,HttpProtocol{
   
    var eHttp: HttpController = HttpController()
    var allHotelData:Array<HotelSingle> = [] //存所有資料
    var selectedHotel:Int = 0 //選取的旅館
    var segmentIndex : Int = 0
    var titleType:String = "飯店"
    var changeIndex : Int?

    @IBOutlet weak var hotelMingsuSegment: UISegmentedControl!
    @IBOutlet weak var selectBlock: UIBarButtonItem!
    @IBOutlet weak var displayAllButton: UIButton!
    
    func didReceiveResults(results:NSArray) {
        //建立所有資料陣列
        for dict:AnyObject in results { //results 是 JSON 資料
            var hotelSingle = HotelSingle(dict: dict as! NSDictionary)
            allHotelData.append(hotelSingle)
        }
        self.tableView.reloadData() //重新顯示資料
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        eHttp.delegate = self //設定HttpController代理
         eHttp.onSearch("http://data.kaohsiung.gov.tw/Opendata/DownLoad.aspx?Type=2&CaseNo1=AV&CaseNo2=4&FileType=2&Lang=C&FolderType=O")
    }
    
    //資料筆數
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
      
            return allHotelData.count
    }
    
    // 點選的旅館
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath {
        selectedHotel = indexPath.row
        return indexPath
    }

    
   
    var buttonTitle:String = "高雄市"
    var buttonTitleReg : String = "高雄市"
    var buttonCounter:Int = 0
    var blockArray : [String] = []
    @IBAction func clickSelectButton(sender: UIButton) {
        
        var selectBlockView:UIAlertView = UIAlertView()
        
        selectBlockView.title = "請選擇區域"
        selectBlockView.delegate = self
       
        blockArray = ["三民區","苓雅區","前鎮區","前金區","小港區","鹽埕區","左營區","楠梓區","鼓山區","旗津區","新興區","鳳山區","取消"]
        for(var i=0 ; i<13 ; i++){
            
            selectBlockView.addButtonWithTitle(blockArray[i])
        }

        
        selectBlockView.show()
        buttonCounter++
    }
    
    
    
    func alertView(selectBlockView: UIAlertView,clickedButtonAtIndex buttonIndex:Int){
        
        if blockArray[buttonIndex] == "取消"{
            
            buttonTitle = buttonTitleReg
        }
        else{
            buttonTitle = blockArray[buttonIndex]
            buttonTitleReg = blockArray[buttonIndex]
        }
        
        self.tableView.reloadData()
        navigationItem.title = "\(buttonTitle)\(titleType)一覽表"

    }
    
    @IBAction func displayAll(sender: UIButton) {
        
        buttonTitle = "高雄市"
        buttonTitleReg = "高雄市"
        buttonCounter = 0
        self.tableView.reloadData()
        navigationItem.title = " 高雄市\(titleType)一覽表"
    }
    
    //顯示旅館名稱及地址
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
       
            cell.textLabel!.text = (allHotelData[indexPath.row].name as String)
            cell.detailTextLabel!.text = (allHotelData[indexPath.row].address as String)
           //篩選
       if(buttonTitle == "高雄市"){
        
            cell.textLabel!.text = (allHotelData[indexPath.row].name as String)
            cell.detailTextLabel!.text = (allHotelData[indexPath.row].address as String)
       }
        
       else if(buttonCounter >= 1 ){
                
                if(allHotelData[indexPath.row].block ==  buttonTitle ){
               
                    cell.textLabel!.text = (allHotelData[indexPath.row].name as String)
                    cell.detailTextLabel!.text = (allHotelData[indexPath.row].address as String)
                }
                    
                else{
                    
                    cell.hidden=true;
                }
        
        }
        return cell
    }
    
    //處理篩選後列表的樣子（調整部分cell）
    override func  tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if(buttonTitle == "高雄市"){
            
            return 50
        }
        
        else if(buttonCounter > 0){
            
            if(allHotelData[indexPath.row].block ==  buttonTitle ){
                
               return 50
            }
            else{
                return 0
            }

        }
        
        return 50
    }
  
    
   override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
       var destViewController:secondViewController = segue!.destinationViewController as! secondViewController
        var hotelSingle = allHotelData[selectedHotel]
        // secondViewController 是接受資料的class名稱
        destViewController.hotelName = hotelSingle.name as String //送旅館名稱
        destViewController.hotelLocation = hotelSingle.address as NSString
        destViewController.hotelRank = hotelSingle.rank as String
        destViewController.hotelPhone = hotelSingle.phone as String
        destViewController.hotelRoom = hotelSingle.room as String
        destViewController.hotelWeb = hotelSingle.web as String
        destViewController.hotelMail = hotelSingle.mail as String
    }
    
}
