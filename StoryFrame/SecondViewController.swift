//
//  SecondViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{

    var cards = [Card]()
    var fetchedResultsController: NSFetchedResultsController!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = UIImage(named: "For You")!.imageWithRenderingMode(.AlwaysOriginal)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.emptyDataSetSource = self
        collectionView.emptyDataSetDelegate = self
        
    }
        override func viewWillAppear(animated: Bool) {
            navigationController?.navigationBarHidden = false
            fetchAndSetResults()
            collectionView.reloadData()
}
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Card")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.cards = results as! [Card]
            
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("favCell", forIndexPath: indexPath) as? FavoriteCell {
             let post = cards[indexPath.row]
            cell.configureCell(post)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        let myCard: Card!
        myCard = cards[indexPath.row]
        performSegueWithIdentifier("viewDetail", sender: myCard)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "viewDetail" {
            if let FinishedViewVC = segue.destinationViewController as? FinishedViewVC {
                if let cardPicked = sender as? Card {
                    
                    FinishedViewVC.cards = cardPicked
                    
                    
                }
            }
            
        }
        
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(93, 115)
    }
    
    //sample for the empty table view need to customise
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Like And Only Watch Favorite Cards"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Like your cards by clicking on the heart available on your created cards!"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "CardsEmptyArray")
    }

}

