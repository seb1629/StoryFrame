//
//  FirstViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{

   
    @IBOutlet weak var createCard: UIBarButtonItem!
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Custom Title nav bar
        let label: UILabel = UILabel(frame: CGRectMake(0, 0, 120, 50))
        label.backgroundColor = UIColor.clearColor()
        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir Next", size: 16)
        label.font = UIFont.systemFontOfSize(16, weight: UIFontWeightRegular)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = titleNavColor
        label.text = "StoryFrame\n My Cards"
        self.tabBarController?.navigationItem.titleView = label
        
        self.tabBarController?.navigationItem.rightBarButtonItem = createCard
       
    }

 
    @IBAction func onCreateCardTapped(sender: AnyObject) {
        performSegueWithIdentifier("addSegue", sender: self)
    }
  
        
    
}

