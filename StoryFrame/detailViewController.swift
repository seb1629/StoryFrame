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
    @IBOutlet weak var topView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(detailViewController.shareTapped))
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        frontImage.image = post.takeCardImage()
        bgImage.image = post.takeCardImage()
        navigationItem.title = post.cardTitle
        descLabel.text = post.cardDescription
        descLabel.backgroundColor = UIColor(white: 1.0, alpha: 0.6)
        descLabel.textColor = UIColor.darkGrayColor()
        descLabel.sizeToFit()
        topView.backgroundColor = UIColor(white: 1, alpha: 0.6)
       
        
        
    }
    
  
    func shareTapped(){
        
    }

    @IBAction func onDeletePressed(sender: UIButton) {
    }
   
    @IBAction func onEditPressed(sender: UIButton) {
    }

    func transparentNavBar(){
                let bar: UINavigationBar! = self.navigationController?.navigationBar
                bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
                bar.shadowImage = UIImage()
                bar.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.30)
        
            }
    
 

    
}
