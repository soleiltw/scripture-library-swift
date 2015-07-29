//
//  thirdViewController.swift
//  Kotel_Swift
//
//  Created by Jeremy Chien on 2015/7/15.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController {
    
    
    var officialWebAddr:String=""
    var officialWebName:String=""
    
    override func viewDidLoad() {
                super.viewDidLoad()
        
        var url = NSURL(string:"\(officialWebAddr)")
        var request = NSURLRequest(URL: url!)
        webView!.loadRequest(request)
        webAddr.text = officialWebAddr
    }

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var stop: UIBarButtonItem!
    @IBOutlet weak var refresh: UIBarButtonItem!
    @IBOutlet weak var lastpage: UIBarButtonItem!
    @IBOutlet weak var nextpage: UIBarButtonItem!
    @IBOutlet weak var webAddr: UITextField!
    
    @IBAction func doStop(sender: UIBarButtonItem) {
        
        webView.stopLoading()
    }
    
    @IBAction func doRefresh(sender: UIBarButtonItem) {
        
        webView.reload()
    }
    
    @IBAction func doNextpage(sender: AnyObject) {
        
        webView.goForward()
    }
    
    @IBAction func doLastpage(sender: UIBarButtonItem) {
        
        webView.goBack()
    }
    
    
}
