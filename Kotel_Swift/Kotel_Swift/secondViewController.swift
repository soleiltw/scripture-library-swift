//
//  secondViewController.swift
//  Kotel_Swift
//
//  Created by Jeremy Chien on 2015/7/15.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    var hotelName:String = ""
    var hotelLocation:NSString=""
    var hotelRank:String=""
    var hotelPhone:String=""
    var hotelRoom:String=""
    var hotelWeb:String=""
    var hotelMail:String=""


    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var map: UIWebView!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var web: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var goweb: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = hotelName
        
        var address:NSString = "http://maps.google.com/maps?hl=zh-TW&q=" + ( hotelLocation as! String)
        
        var url: NSURL = NSURL(string: address.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!
        
        var request : NSURLRequest = NSURLRequest(URL: url)
        
        self.map.loadRequest(request)
        
        rank.text = "星等:\(hotelRank)"
        phone.text = " 訂房專線:\(hotelPhone)"
        room.text = "客房總數:\(hotelRoom)"
        web.text = "官方網站:\(hotelWeb)"
        mail.text = "電子信箱:\(hotelMail)"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destViewController:thirdViewController = segue.destinationViewController as! thirdViewController
        
        destViewController.officialWebAddr = (hotelWeb as String?)!
         destViewController.officialWebName = (hotelName as String?)!
    }
    

}
