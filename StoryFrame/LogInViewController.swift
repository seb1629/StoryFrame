//
//  LogInViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import Canvas

class LogInViewController: UIViewController {

    @IBOutlet weak var animationView: CSAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
    }
    
    @IBAction func onButtonPressed(sender: UIButton) {
        animationView.startCanvasAnimation()
        performSegueWithIdentifier("loginSegue", sender: self)
    }
        

}
