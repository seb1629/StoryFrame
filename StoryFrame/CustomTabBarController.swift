//
//  CustomTabBarController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 16/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, UINavigationControllerDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        UITabBar.appearance().barTintColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        UITabBar.appearance().selectionIndicatorImage = UIImage().makeImageWithColorAndSize(themeColor, size: CGSizeMake(tabBar.frame.width/3, tabBar.frame.height))
        
        
    }

    
    

}

extension UIImage {
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}