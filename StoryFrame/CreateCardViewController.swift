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
   
    var imagePicker: UIImagePickerController! = UIImagePickerController()
    var popover: UIPopoverPresentationController? = nil
    
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
        
        
    }

    @IBAction func onCancelTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCameraTapped(sender: AnyObject) {
        alertPopup()
    }
    
    @IBAction func onDeletePressed(sender: UIButton) {
        //insert code
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
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .ActionSheet)
        
         popover = alert.popoverPresentationController
        
        let cameraAction = UIAlertAction(title: "Camera", style: .Default) { UIAlertAction in
            
           self.openTheCamera()
        }
        
        let photoGalleryAction = UIAlertAction(title: "Photo Library", style: .Default) { UIAlertAction in
            self.openGallery()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { UIAlertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        imagePicker?.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(photoGalleryAction)
        alert.addAction(cancelAction)
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            popover?.sourceView = view
            popover?.sourceRect = CGRect(x: CGRectGetMidX(UIScreen.mainScreen().bounds), y: 100, width: 50, height: 50) //(getMid.x:100, y:50, width: 64, height: 50)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    
        alert.view.tintColor = UIColor(red: 101/255, green: 182/255, blue: 255/255, alpha: 1.0)
    }
    
    
    //func for camera and Gallery
    func openTheCamera(){
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
         imagePicker!.sourceType = UIImagePickerControllerSourceType.Camera
        presentTheViewControllerImgPicked()
        } else {
            openGallery()
        }
    }
    
    func openGallery(){
        imagePicker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            self.presentViewController(imagePicker, animated: true, completion: nil)
        } else {
            popover?.sourceView = view
            popover?.sourceRect = CGRect(x:100, y:50, width: 64, height: 50)
            presentTheViewControllerImgPicked()
        }
    }
    
    
    func presentTheViewControllerImgPicked(){
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
   

    //func for imagepicker
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
            imagePicker.dismissViewControllerAnimated(true, completion: nil)
            currentImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

}
