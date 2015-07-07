//
//  SecondViewController.swift
//  ACViews_Swift
//
//  Created by Jeremy Chien on 2015/7/6.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var BigView: UIView!
    @IBOutlet weak var SmallView: UIView!
    @IBAction func TapOnce(sender: UITapGestureRecognizer) {
    }
    
    var TapTwiceCounter = 1
    
    @IBAction func TapTwice(sender: UITapGestureRecognizer) {
        
        if(TapTwiceCounter == 1)
        {
            SmallView.backgroundColor = UIColor.brownColor()
            SmallView.frame.size.height = 300
            SmallView.frame.size.width = 300
        }
        
       else if( TapTwiceCounter >= 2 && TapTwiceCounter%2 == 0 )
        {
            SmallView.frame.size.height = 250
            SmallView.frame.size.width = 250
        }
        
        else if( TapTwiceCounter >= 2 && TapTwiceCounter%2 == 1 )
        {
            SmallView.frame.size.height = 300
            SmallView.frame.size.width = 300
        }
        
        TapTwiceCounter++

    }
    @IBAction func Pan(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(self.view)
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                y:view.center.y + translation.y)
        }
        sender.setTranslation(CGPointZero, inView: self.view)
        
           }
    @IBAction func TwoTapFarAway(sender: UIPinchGestureRecognizer) {
        
        if(sender.state == UIGestureRecognizerState.Began)
        {
            
        }
        
        else if(sender.state == UIGestureRecognizerState.Changed)
        {
            SmallView.alpha = sender.scale / 0.5
            //用滑動的幅度控制透明度
        }
        
        else if (sender.state == UIGestureRecognizerState.Ended)
        {
            
        }
        
    }
    @IBAction func LongPress(sender: UILongPressGestureRecognizer) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func RotateControll(sender: UIRotationGestureRecognizer) {
        
        var rad : CGFloat = sender.rotation
        var angle : Double = Double(rad) * 180 / M_1_PI
        
        SmallView.transform = CGAffineTransformMakeRotation(rad)
    }
        @IBAction func SwipeRight(sender: UISwipeGestureRecognizer) {
            
          BigView.backgroundColor = UIColor.redColor()
            
    }
    @IBAction func SwipeLeft(sender: UISwipeGestureRecognizer) {
        
         BigView.backgroundColor = UIColor.orangeColor()
    }
    @IBAction func SwipeUp(sender: UISwipeGestureRecognizer) {
         BigView.backgroundColor = UIColor.blackColor()
    }
    @IBAction func SwipeDown(sender: UISwipeGestureRecognizer) {
         BigView.backgroundColor = UIColor.blueColor()
    }
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
