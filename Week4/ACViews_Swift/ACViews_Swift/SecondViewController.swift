//
//  SecondViewController.swift
//  ACViews_Swift
//
//  Created by Jeremy Chien on 2015/7/6.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet var BigView: UIView!
    @IBOutlet weak var SmallView: UIView!
    @IBAction func TapOnce(sender: UITapGestureRecognizer) {
        
         SmallView.alpha = 1.0 //將SmallView的透明度設為1
    }
    
    
    
    @IBAction func TapTwice(sender: UITapGestureRecognizer) {
        
        SmallView.backgroundColor = UIColor.brownColor()
        SmallView.alpha = 1.0
        
        let isScaled : (Bool) = CGAffineTransformIsIdentity(SmallView.transform) //初始化
     
        if isScaled{
            
            var scalingTransform :(CGAffineTransform) = CGAffineTransformMakeScale(1.2 , 1.2)

            SmallView.transform = scalingTransform

        }
        
        else{
            
            SmallView.transform = CGAffineTransformIdentity

        }
        
    }
    
    
    @IBAction func Pinch(sender: UIPinchGestureRecognizer) {
        
        SmallView.alpha = sender.scale 
    }

    //Swipe揮擊
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
    ///////

    @IBAction func LongPress(sender: UILongPressGestureRecognizer) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func Pan(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(self.view)
        
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                y:view.center.y + translation.y)
        }
        
        sender.setTranslation(CGPointZero, inView: self.view)
        
        /*
        if (sender.state == UIGestureRecognizerState.Ended){
        
        var velocity = sender.velocityInView(view)
        var magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
        var slideMult = magnitude / 200
        
        var slideFactor = 0.1 * slideMult
        var finalPoint = CGPointMake(sender.view!.center.x + (velocity.x * slideFactor), sender.view!.center.y+(velocity.y * slideFactor))
        
        finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
        finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
        
        UIView.animateWithDuration(slideFactor*2, delay: 0, options:UIViewAnimationOptions.CurveEaseOut, animations:{ sender.view!.center = finalPoint}, completion: nil)
        }
        */
    }

    
    @IBAction func RotateControll(sender: UIRotationGestureRecognizer) {
        
        var rad : CGFloat = sender.rotation
       
        SmallView.transform = CGAffineTransformMakeRotation(rad)
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
