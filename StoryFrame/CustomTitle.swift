//
//  CustomTitle.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class CustomTitle: UILabel {

    let label: UILabel = UILabel(frame: CGRectMake(0,0,400,50))
    
    override func awakeFromNib() {
        label.backgroundColor = UIColor.clearColor()
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.textColor = UIColor(red: 155/255, green: 47/255, blue: 174/255, alpha: 1.0)
        label.textAlignment = .Center
        label.text = "StoryFrame/n My Cards"
        
        
    }

}
