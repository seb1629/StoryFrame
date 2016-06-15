//
//  CreateCardViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class CreateCardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UIPopoverControllerDelegate {

    @IBOutlet weak var openCamera: UIBarButtonItem!
    var imagePicker: UIImagePickerController!
 
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var photoLocationLabel: UILabel!
    @IBOutlet weak var datePhotoTaken: UILabel!
    @IBOutlet weak var instructionTextView: UITextView!
    @IBOutlet weak var currentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        transparentNavBar()
        customRightBarButton()
        
        
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
       //setupLayer()
    }

    @IBAction func onCancelTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCameraTapped(sender: AnyObject) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onDeletePressed(sender: UIButton) {
    }
    
    
     //Custom button navBar
    
    func transparentNavBar(){
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.65)
        locationView.backgroundColor = UIColor(white: 1, alpha: 0.3)
    }
    
    func customRightBarButton(){
        let btn: UIButton = UIButton(type: UIButtonType.Custom)
        
        btn.setImage(UIImage(named: "cameranavbar"), forState: .Normal)
        btn.addTarget(self, action: #selector(onCameraTapped), forControlEvents: UIControlEvents.TouchUpInside)
        btn.frame = CGRectMake(0, 0, 27.5, 22)
        
        let barButton = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    
    //if I Need Shadow later
//    func setupLayer() {
//        
//        
//        currentImage.layer.shadowColor = UIColor.blackColor().CGColor
//        currentImage.layer.shadowOffset = CGSizeMake(0, 10)
//        currentImage.layer.shadowOpacity = 1
//        currentImage.layer.shadowRadius = 10
//        currentImage.layer.shadowPath = UIBezierPath(rect: currentImage.bounds).CGPath
//    }
    

    //func for imagepicker
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        currentImage.image = image
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
