//
//  AddingNumbers.swift
//  HW_2_ChristianOBrien
//
//  Created by Christian O'Brien on 2/15/16.
//  Copyright © 2016 ChristianOBrien. All rights reserved.
//

import UIKit

class AddingNumbers: UIViewController {

    @IBOutlet weak var sumOfNumbers: UILabel!
    @IBOutlet weak var numberField: UITextField!
    
    var newNumber: Int = 0
    var numberSum : Int = 0

    @IBAction func buttonClicked(sender: AnyObject) {
        
        newNumber = Int(numberField.text!)!
        //get new entered number
    
        numberSum = numberSum + newNumber
        //add to sum
        
        sumOfNumbers.text = String(numberSum)
        
    }
    
}
