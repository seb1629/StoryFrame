//
//  top aligned.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 20/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//
import UIKit

@IBDesignable class TopAlignedLabel: UILabel {
    override func drawTextInRect(rect: CGRect) {
        if let stringText = text {
            let stringTextAsNSString = stringText as NSString
            let labelStringSize = stringTextAsNSString.boundingRectWithSize(CGSizeMake(CGRectGetWidth(self.frame), CGFloat.max),
                                                                            options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                                                                            attributes: [NSFontAttributeName: font],
                                                                            context: nil).size
            super.drawTextInRect(CGRectMake(10, 10, CGRectGetWidth(self.frame) - 20, ceil(labelStringSize.height)))
        } else {
            super.drawTextInRect(rect)
        }
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        self.textColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1.0)
        self.font = UIFont(name: "Avenir Next-regular", size: 13)

    }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 0.6).CGColor
//        self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).CGColor
//        self.layer.shadowOffset = CGSizeMake(0, 2)
//        self.layer.shadowOpacity = 0.6
//        self.layer.shadowRadius = 2.0
//        self.layer.shouldRasterize = true
    }
    override func awakeFromNib() {


    }

        }

