//
//  CustomShadow.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 17/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class CustomShadow: UIView {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: shadowColor, green: shadowColor, blue: shadowColor, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }

}
