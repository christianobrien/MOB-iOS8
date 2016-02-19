//
//  Animal.swift
//  HW_3_ChristianOBrien
//
//  Created by Christian O'Brien on 2/17/16.
//  Copyright © 2016 ChristianOBrien. All rights reserved.
//

import UIKit

class Animal: NSObject {
    
    let name: String
    
    init(name: String){
        self.name = name
    }
    
    func prettyAnimalName() -> String {
        return "Animal name: " + self.name
    }
}
