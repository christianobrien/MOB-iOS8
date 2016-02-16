//
//  OddOrEven.swift
//  HW_2_ChristianOBrien
//
//  Created by Christian O'Brien on 2/15/16.
//  Copyright © 2016 ChristianOBrien. All rights reserved.
//

import UIKit

class OddOrEven: UIViewController {

    @IBOutlet weak var numberEntered: UITextField!
    @IBOutlet weak var labelView: UILabel!
    
    var numba: Int = 0
    @IBAction func buttonPressed(sender: AnyObject) {
        numba = Int(numberEntered.text!)!
        
        if (numba == 0) {
            labelView.text = "0 is neither even nor odd"
        } else if (numba % 2 == 0){
            labelView.text = "This number was even."
        } else if (numba % 2 == 1){
            labelView.text = "This number was odd."
        }

    }
}
