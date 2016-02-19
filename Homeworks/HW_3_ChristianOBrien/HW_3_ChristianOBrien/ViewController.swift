//
//  ViewController.swift
//  HW_3_ChristianOBrien
//
//  Created by Christian O'Brien on 2/16/16.
//  Copyright © 2016 ChristianOBrien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swipeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "colorful-squares")
        self.view.insertSubview(backgroundImage, atIndex: 0)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func displayTableViewController(sender: AnyObject) {
        
        self.performSegueWithIdentifier("swiperToTableView", sender: self)
    }
    
}

