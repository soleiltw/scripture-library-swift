//: Playground - noun: a place where people can play

import UIKit

var url = NSURL(string: "http://data.kaohsiung.gov.tw/Opendata/DownLoad.aspx?Type=2&CaseNo1=AV&CaseNo2=4&FileType=2&Lang=C&FolderType=O")

var data = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingUncached, error: nil)

var json : AnyObject = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)!

for result in json as!NSArray{
    
    var name = result.objectForKey("") as! NSArray
    
}
