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

    var post: Card!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var datePhotoLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(detailViewController.shareTapped))
        
        }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        frontImage.image = post.takeCardImage()
        navigationItem.title = post.cardTitle
        descLabel.text = post.cardDescription
        descLabel.backgroundColor = UIColor(white: 1.0, alpha: 0.6)
        descLabel.textColor = UIColor.darkGrayColor()
        descLabel.sizeToFit()
    }
  
    func shareTapped(){
        
    }

    @IBAction func onDeletePressed(sender: UIButton) {
    }
   
    @IBAction func onEditPressed(sender: UIButton) {
    }

    
}
