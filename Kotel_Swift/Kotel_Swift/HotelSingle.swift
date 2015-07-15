//
//  HotelSingle.swift
//  Kotel_Swift
//
//  Created by Jeremy Chien on 2015/7/14.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class HotelSingle{
    
    var name:NSString!
    var rank:NSString!
    var city:NSString!
    var block:NSString!
    var address:NSString!
    var phone:NSString!
    var room:NSString!
    var web:NSString!
    var mail:NSString!

    
    init(dict:AnyObject){
        self.name = dict["旅宿名稱"] as! String
        self.rank = dict["星等"] as! String
        self.city = dict["縣市"] as! String
        self.block = dict["鄉鎮"] as! String
        self.address = dict["地址"] as! String
        self.phone = dict["電話"] as! String
        self.room = dict["房間數"] as! String
        self.web = dict["網址"] as! String
        self.mail = dict["電子郵件"] as! String
    }
    
}
