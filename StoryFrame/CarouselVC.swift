//
//  CarouselVC.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 26/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import CoreData

class CarouselVC: UIViewController, iCarouselDelegate, iCarouselDataSource{

    
    var fetchedResultsController: NSFetchedResultsController!
    var cardSaved = [Card]()
     @IBOutlet var carouselView: iCarousel!
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselView.type = .Cylinder
        
        
    }

    override func viewWillAppear(animated: Bool) {
        fetchAndSetResults()
       carouselView.reloadData()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardSaved = [Card]()
    }
//core data
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Card")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
           self.cardSaved = results as! [Card]
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    // iCarousel
    func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
        return cardSaved.count
    }

    
    func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
        
        
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 277))
       
    
        let daCard = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 277))
        daCard.image = cardSaved[index].takeCardImage()
        view.addSubview(daCard)
        
        
        return view
    }
    
    
    func carousel(carousel: iCarousel, valueForOption option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.Spacing {
            
            //could be 1.1 or 1.2
            return value * 1.1
        }
        
        return value
    }
    
    

}
