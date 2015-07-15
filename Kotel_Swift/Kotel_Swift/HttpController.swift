//
//  HttpController.swift
//  TaipeiHotel
//
//  Created by Jeremy Chien on 2015/7/14.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

protocol HttpProtocol{
    func didReceiveResults(results:NSArray)
}

class  HttpController:NSObject{
    
    var delegate:HttpProtocol?
    
    func onSearch(url:String){
        
        var nsUrl: NSURL = NSURL(string: url)!
        var request:NSURLRequest = NSURLRequest(URL:nsUrl)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            var httpResponse = response as! NSHTTPURLResponse
            if httpResponse.statusCode == 200{
                
                var array: NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSArray
                self.delegate?.didReceiveResults(array)
                
            }
        }
        
    }
    
}
