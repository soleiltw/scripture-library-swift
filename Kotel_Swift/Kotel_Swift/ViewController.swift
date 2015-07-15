//
//  ViewController.swift
//  Kotel_Swift
//
//  Created by Jeremy Chien on 2015/7/14.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hotelName:String = ""
   // var hotelAddr:NSString = ""
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addr: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = hotelName
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

