//
//  ViewController.swift
//  ACViews_Swift
//
//  Created by Jeremy Chien on 2015/7/6.
//  Copyright (c) 2015年 Jeremy Chien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var ButtonN: UIButton!
    @IBOutlet weak var ButtonL: UIButton!
    
    @IBOutlet weak var onetwothree: UISegmentedControl!
    
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var Switch: UISwitch!
    
    @IBOutlet weak var Progress: UIProgressView!
    
    
    @IBOutlet weak var Waiting: UIActivityIndicatorView!
    @IBAction func PressButtonN(sender: UIButton) {
        
        Label1.text = " Neque porro"
        
            }
    
    
    
    
    
    
    @IBAction func ValueChanged(sender: UISegmentedControl) {
        
        
        
        
        
            input.text = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        
        
        
    
    }
    @IBAction func PressButtonL(sender: UIButton) {
        
        Label1.text = " Lorem ipsum"
    }
    @IBAction func SliderValueChanged(sender: UISlider) {
        
        if(Switch.on){
             Progress.setProgress(Slider.value, animated: true)
        }
        
       
    
    }

    @IBAction func SwitchValueChange(sender: UISwitch) {
        
    
        
        if (Switch.on){
            
            Progress.setProgress(Slider.value, animated: true)
            Waiting .startAnimating()
            
        }
        else
        {
            Progress.setProgress(0.0, animated: true)
            Waiting .stopAnimating()
        }
        
        //Slider.enabled = Switch.on
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
///////

}

