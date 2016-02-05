//
//  ViewController.swift
//  HW_1_ChristianOBrien
//
//  Created by Christian O'Brien on 1/31/16.
//  Copyright © 2016 ChristianOBrien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var largeView: UIView!
    @IBOutlet weak var textBox: UITextView!
    @IBOutlet weak var buttonView: UIButton!
    
    @IBAction func buttonClicked(sender: AnyObject) {
        
        largeView.backgroundColor = UIColor.whiteColor()
    
        
        if(buttonView.backgroundColor == UIColor.blackColor()){
            
            largeView.backgroundColor = UIColor.cyanColor()
            textBox.text = "You tried to undo it. NOPE. I know forever!!!"
            textBox.textColor = UIColor.yellowColor()
        }
        
        if(largeView.backgroundColor == UIColor.whiteColor()){
        

        largeView.backgroundColor = UIColor.redColor()
        textBox.text = "Yup. You pressed it. I know."
        textBox.textColor = UIColor.yellowColor()
        buttonView.backgroundColor = UIColor.blackColor()
        }
    
    
    }
    

}

