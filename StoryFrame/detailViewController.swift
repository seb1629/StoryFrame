//
//  detailViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 19/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import CoreData

class detailViewController: UIViewController {

    
    
    
     var titleFieldDetail = ""
     var instructionTextViewDetail = ""
     var currentImageDetail: UIImage!
    
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var datePhotoLabel: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var frontImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(detailViewController.saveTapped))
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        frontImage.image = currentImageDetail
        bgImage.image = currentImageDetail
        descLabel.text = instructionTextViewDetail
        navigationItem.title = titleFieldDetail
        topView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        descLabel.sizeToFit()
        descLabel.backgroundColor = UIColor(white: 1.0, alpha: 0.6)
        descLabel.textColor = UIColor.darkGrayColor()
    
    }
    
  
    func saveTapped(){
        
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Card", inManagedObjectContext: context)!
            let card = Card(entity: entity, insertIntoManagedObjectContext: context)
            card.cardTitle = navigationItem.title
            card.cardDescription = descLabel.text
            card.prepareCardImage(frontImage.image!)
    
            context.insertObject(card)
            
            do {
                try context.save()
                
            }catch{
                print("could not save the card")
            }
            dismissViewControllerAnimated(true, completion: nil)
            
       
            
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
