//
//  SecondViewController.swift
//  ACViews_Swift
//
//  Created by Jeremy Chien on 2015/7/6.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit
//import Cocoa
import Darwin

class SecondViewController: UIViewController {

    @IBOutlet var BigView: UIView!
    @IBOutlet weak var SmallView: UIView!
    @IBAction func TapOnce(sender: UITapGestureRecognizer) {
    }
    
    var TapTwiceCounter = 1
    
    @IBAction func TapTwice(sender: UITapGestureRecognizer) {
        
        
        
        SmallView.backgroundColor = UIColor.brownColor()
        SmallView.alpha = 1.0
        
        
        let isScaled : (Bool)
        isScaled = !CGAffineTransformIsIdentity(SmallView.transform)
        
        if !isScaled {
            
            var scalingTransform :(CGAffineTransform)
            
            scalingTransform = CGAffineTransformMakeScale(1.2 , 1.2)
            
            SmallView.transform = scalingTransform
        }
        
        else {
            SmallView.transform = CGAffineTransformIdentity
        }

        
        
        /*
        if !isScaled {
            CGAffineTransform scalingTransform;
            scalingTransform = CGAffineTransformMakeScale(1.2, 1.2)
            SmallView.view.transform = scalingTransform;
        } else {
            SmallView.view.transform = CGAffineTransformIdentity;
        }
        */

        
        
        /* My code
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
        */

    }
    @IBAction func Pan(sender: UIPanGestureRecognizer) {
        
        /*
        var translation = sender.translationInView(self.view)
        sender.view!.center = CGPointMake(sender.view!.center.x + translation.x, sender.view!.center.y + translation.y)
        sender .setTranslation(CGPointMake(0 , 0), inView: self.view)
        
        if sender.state == UIGestureRecognizerState.Ended{
            
            var velocity = sender.velocityInView(self.view)
            
           
            let magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMult = magnitude / 200
            print("magnitude: %f , slideMult: %f" , magnitude , slideMult )
            
            var slideFactor : Float
            slideFactor = 0.1 * slideMult
            let finalPoint = CGPointMake(sender.view!.center.x + (velocity.x * slideFactor) , sender.view!.center.y + (velocity.y * slideFactor))
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)

           
            UIView.animateWithDuration(slideFactor*2 , delay: 0 , options: UIViewAnimationOptions.CurveEaseOut, animations: { (sender.view!.center); finalPoint}, completion: nil)
        }
        */
        
        /*
        UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *)sender;
        CGPoint translation = [panGesture translationInView:self.view];
        panGesture.view.center = CGPointMake(panGesture.view.center.x + translation.x,
        panGesture.view.center.y + translation.y);
        [panGesture setTranslation:CGPointMake(0, 0) inView:self.view];
        
        if (panGesture.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [panGesture velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(panGesture.view.center.x + (velocity.x * slideFactor),
        panGesture.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        panGesture.view.center = finalPoint;
        } completion:nil];
        
        }
        */
        
        //My code
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
