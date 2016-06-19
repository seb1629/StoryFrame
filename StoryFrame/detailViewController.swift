//
//  detailViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 19/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import Social
import Accounts

class detailViewController: UIViewController {

    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(detailViewController.shareTapped))

        }

  
    func shareTapped(){
        
    }


}
