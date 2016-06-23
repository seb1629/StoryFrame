//
//  customBtn.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 23/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

@IBDesignable
class customBtn: UIButton {

    var borderWidth: CGFloat = 2.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.borderWidth = borderWidth
        self.frame = CGRectInset(self.frame, -borderWidth, -borderWidth);
    }

}
