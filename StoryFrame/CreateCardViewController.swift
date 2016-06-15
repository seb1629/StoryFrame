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
    var cameraViewController: UIImagePickerController!
    
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
        
        cameraViewController = UIImagePickerController()
        cameraViewController.delegate = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
       //setupLayer()
    }

    @IBAction func onCancelTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCameraTapped(sender: AnyObject) {
        alertPopup()
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
    
    
    func alertPopup(){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { UIAlertAction in
            
           self.presentViewController(self.cameraViewController, animated: true, completion: nil)
        }
        
        let photoGalleryAction = UIAlertAction(title: "Photo Library", style: .Default) { UIAlertAction in
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { UIAlertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        alert.addAction(cameraAction)
        alert.addAction(photoGalleryAction)
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        alert.view.tintColor = UIColor(red: 101/255, green: 182/255, blue: 255/255, alpha: 1.0)
    }
    
    
    //func for camera
    func onCameraPressed(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            let cameraViewController = UIImagePickerController()
            cameraViewController.sourceType = UIImagePickerControllerSourceType.Camera
            cameraViewController.delegate = self
            
            self.presentViewController(cameraViewController, animated: true, completion: nil)
        }
    }
    
    
    
    
   

    //func for imagepicker
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
            imagePicker.dismissViewControllerAnimated(true, completion: nil)
            currentImage.image = image
       
        }
        
    
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

}
