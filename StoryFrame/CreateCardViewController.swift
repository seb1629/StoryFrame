//
//  CreateCardViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class CreateCardViewController: UIViewController {

    @IBOutlet weak var openCamera: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Custom button navBar
        let btn: UIButton = UIButton(type: UIButtonType.Custom)
         
         btn.setImage(UIImage(named: "cameranavbar"), forState: .Normal)
         btn.addTarget(self, action: #selector(onCameraTapped), forControlEvents: UIControlEvents.TouchUpInside)
         btn.frame = CGRectMake(0, 0, 27.5, 22)
         
         let barButton = UIBarButtonItem(customView: btn)
         self.navigationItem.rightBarButtonItem = barButton
        

       
    }

    @IBAction func onCancelTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCameraTapped(sender: AnyObject) {
        
    }

}
