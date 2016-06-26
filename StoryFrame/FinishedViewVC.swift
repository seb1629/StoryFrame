//
//  CarouselVC.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 24/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit



class FinishedViewVC: UIViewController  {
    var cards: Card!
    
    
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentImage: UIImageView!
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = cards.cardTitle
      
        currentImage.image = cards.takeCardImage()
        
                
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    
    @IBAction func deleteTapped(sender: UIButton) {
        
    }
    
    @IBAction func EditTapped(sender: UIButton) {
        
    }
   
    
    
}
