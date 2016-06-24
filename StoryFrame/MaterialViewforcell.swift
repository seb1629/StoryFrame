//
//  MaterialViewforcell.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 24/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class MaterialViewforcell: UIView {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: shadowColor, green: shadowColor, blue: shadowColor, alpha: shadowColor).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }

}
