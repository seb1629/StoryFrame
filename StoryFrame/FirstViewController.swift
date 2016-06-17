//
//  FirstViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{

   var posts = [Post]()
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createCard: UIBarButtonItem!
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                
        tabBarItem.selectedImage = UIImage(named: "Card Collection")!.imageWithRenderingMode(.AlwaysOriginal)
        tableView.delegate = self
        tableView.dataSource = self
        setupNavBar()
       
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.separatorInset = UIEdgeInsetsZero
        
        tableView.emptyDataSetSource = self
        tableView.emptyDataSetDelegate = self
        tableView.tableFooterView = UIView()
    }

 
    @IBAction func onCreateCardTapped(sender: AnyObject) {
        performSegueWithIdentifier("addSegue", sender: self)
    }
  
    func setupNavBar(){
        let label: UILabel = UILabel(frame: CGRectMake(0, 0, 120, 50))
        label.backgroundColor = UIColor.clearColor()
//        label.numberOfLines = 2
        label.font = UIFont(name: "Avenir Next", size: 20)
        label.font = UIFont.systemFontOfSize(16, weight: UIFontWeightHeavy)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = titleNavColor
        label.text = "StoryFrame"
        self.tabBarController?.navigationItem.titleView = label
        self.tabBarController?.navigationItem.rightBarButtonItem = createCard
    }
    
    //tableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostTableViewCell") as? PostTableViewCell {
            cell.configurePost(post)
            cell.layoutMargins = UIEdgeInsetsZero
            return cell
        } else {
            let cell = PostTableViewCell()
            cell.configurePost(post)
            return cell
        }
    
}
    
    //sample for the empty table view need to customise
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Start Creating Awesome Cards"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let str = "Tap the + button at the top of the screen to add your first StoryFrame!"
        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
        return NSAttributedString(string: str, attributes: attrs)
    }
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "CardsEmptyArray")
    }
    
//    func buttonTitleForEmptyDataSet(scrollView: UIScrollView!, forState state: UIControlState) -> NSAttributedString! {
//        let str = "Add Grokkleglob"
//        let attrs = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleCallout)]
//        return NSAttributedString(string: str, attributes: attrs)
//    }
//    
//    func emptyDataSetDidTapButton(scrollView: UIScrollView!) {
//        let ac = UIAlertController(title: "Button tapped!", message: nil, preferredStyle: .Alert)
//        ac.addAction(UIAlertAction(title: "Hurray", style: .Default, handler: nil))
//        presentViewController(ac, animated: true, completion: nil)
//    }
    
}
