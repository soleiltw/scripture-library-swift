//
//  SecondViewController.swift
//  Test
//
//  Created by Jeremy Chien on 2015/7/3.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var SliderValue: UILabel!
    @IBAction func SliderCange(sender: UISlider) {
        
        SliderValue.text = " \(Int(Slider.value ))%"
        //SliderValue.frame = CGRect( width: \Int(Slider.value) , height: \Int(Slider.value))
        
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
