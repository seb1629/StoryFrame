//
//  roundedImage.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 14/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class roundedImage: UIImageView {

  
    override func awakeFromNib() {
    setupLayer()
        
    }

    func setupLayer(){
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
        
            }
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(0, 2)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 2.0
        self.layer.backgroundColor = UIColor(white: 1.0, alpha: 1.0).CGColor
        self.layer.opacity = 0.6
    }

    
}
