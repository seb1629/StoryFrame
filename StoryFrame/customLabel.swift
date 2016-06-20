//
//  customLabel.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 20/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class customLabel: UILabel {

    override func awakeFromNib() {
        setupLayer()
        
    }

    func setupLayer(){
        self.layer.backgroundColor = UIColor(white: 1.0, alpha: 0.75).CGColor
        self.textColor = UIColor.darkGrayColor()
        self.font = UIFont(name: "Avenir Next - regular", size: 13)

    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        
        self.layer.shadowOffset = CGSizeMake(0, 2)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 5.0
        
    }
}
