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
        self.layer.cornerRadius = 4.0
        self.clipsToBounds = true
    }
    
    
}
