//
//  FirstViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

   
  
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
    }

 
    @IBAction func onCreateCardTapped(sender: AnyObject) {
        performSegueWithIdentifier("addSegue", sender: self)
    }
  
    func setupNavBar(){
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
    
    //tableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = "hello it s working"
        if let cell = tableView.dequeueReusableCellWithIdentifier("postCell") as? PostTableViewCell {
            cell.configurePost(post)
            cell.layoutMargins = UIEdgeInsetsZero
            return cell
        } else {
            let cell = PostTableViewCell()
            cell.configurePost(post)
            return cell
        }
    
}
}
