//
//  SecondViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController{

    var cards = [Card]()
    var fetchedResultsController: NSFetchedResultsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.selectedImage = UIImage(named: "For You")!.imageWithRenderingMode(.AlwaysOriginal)
    }
        override func viewWillAppear(animated: Bool) {
            navigationController?.navigationBarHidden = false
}
}

