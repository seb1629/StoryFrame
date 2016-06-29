//
//  CarouselVC.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 24/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import Social
import Accounts
import CoreData

class FinishedViewVC: UIViewController  {
    var cards: Card!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentImage: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = cards.cardTitle
      
        currentImage.image = cards.takeCardImage()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(shareTapped))
        topView.backgroundColor = UIColor(white: 1, alpha: 1)
         navigationController?.navigationBarHidden = false
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
       
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
  
    
    func shareTapped(){
        let vc = UIActivityViewController(activityItems: [cards.takeCardImage()], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
    
    

    
    @IBAction func deleteTapped(sender: UIButton) {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let moc = app.managedObjectContext
        moc.deleteObject(cards)
        app.saveContext()
        
    }
    
    @IBAction func EditTapped(sender: UIButton) {
        
    }
   
    
    
}
