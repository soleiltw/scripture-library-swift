//
//  secondViewController.swift
//  Kotel_Swift
//
//  Created by Jeremy Chien on 2015/7/15.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit
import MapKit

class secondViewController: UIViewController {
    
    var hotelName:String = ""
    var hotelLocation:NSString=""
    var hotelRank:String=""
    var hotelPhone:String=""
    var hotelRoom:String=""
    var hotelWeb:String=""
    var hotelMail:String=""

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var room: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var goweb: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.title = hotelName
        
        map.zoomEnabled = true
        
        //地址轉經緯度
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(hotelLocation as! String, completionHandler: {
                (placemarks:[AnyObject]!,error:NSError!) -> Void in
           
                let placemark = placemarks[0] as! CLPlacemark
                
                
                let point = CLLocationCoordinate2D(latitude: placemark.location.coordinate.latitude, longitude: placemark.location.coordinate.longitude)
                let span = MKCoordinateSpanMake(0.01, 0.01)
                let region = MKCoordinateRegion(center: point, span: span)
                self.map.setRegion(region, animated: true)
                
                var needle:MKPointAnnotation = MKPointAnnotation();
                //設定大頭針的座標位置
                needle.coordinate = CLLocationCoordinate2D(latitude: placemark.location.coordinate.latitude, longitude: placemark.location.coordinate.longitude);
                needle.title = self.hotelName as String
                needle.subtitle = self.hotelLocation as! String
            
                self.map.addAnnotation(needle)
        })
        
        if(hotelMail == ""){
            hotelMail = "無"
        }
        
        rank.text = "星等 : \(hotelRank)"
        phone.text = "訂房專線 : \(hotelPhone)"
        room.text = "客房總數 : \(hotelRoom)"
        mail.text = "電子信箱 : \(hotelMail)"
        location.text = "地址 : \(hotelLocation)"
        
        if(hotelWeb == ""){
            
            goweb.enabled = false
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destViewController:thirdViewController = segue.destinationViewController as! thirdViewController
        
        destViewController.officialWebAddr = (hotelWeb as String?)!
        destViewController.officialWebName = (hotelName as String?)!
    }
    

}
