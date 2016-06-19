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
            super.drawTextInRect(CGRectMake(10, 10, CGRectGetWidth(self.frame), ceil(labelStringSize.height)))
        } else {
            super.drawTextInRect(rect)
        }
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderWidth = 1
        layer.borderColor = UIColor.blackColor().CGColor
    }
    
        }

