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
        self.layer.backgroundColor = UIColor(white: 1.0, alpha: 0.6).CGColor
        self.textColor = UIColor.darkGrayColor()
        self.font = UIFont(name: "Avenir Next - regular", size: 13)
    }

}
