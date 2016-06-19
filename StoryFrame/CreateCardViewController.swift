//
//  CreateCardViewController.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 13/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit
import CoreData


class CreateCardViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UIPopoverControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var openCamera: UIBarButtonItem!
   
    var imagePicker: UIImagePickerController! = UIImagePickerController()
    var popover: UIPopoverPresentationController? = nil
    
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var styleButton: UIButton!
    @IBOutlet weak var categoriesButton: UIButton!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var instructionTextView: UITextView!
    @IBOutlet weak var currentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       titleField.backgroundColor = UIColor(white: 1, alpha: 0.3)
        instructionTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        instructionTextView.textContainer.maximumNumberOfLines = 7
        instructionTextView.textContainer.lineBreakMode = .ByWordWrapping
    self.instructionTextView.placeholder = "Enter your last name"
        setupLayer()
//        transparentNavBar()
        customRightBarButton()
        
        
        
        //test for saving data with realm
        
        
        
}
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = range.rangeForString(currentText) else { return false }
        
        let changedText = currentText.stringByReplacingCharactersInRange(stringRange, withString: text)
        
        return changedText.characters.count <= 4
    }

    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //instructionTextView.sizeToFit()
        

        dispatch_async(dispatch_get_main_queue()) {
            self.instructionTextView.scrollRangeToVisible(NSMakeRange(0, 0))
        }
    }

    
    @IBAction func onCancelTapped(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCameraTapped(sender: UIBarButtonItem) {
        alertPopup()
    }
    
    @IBAction func onStyleBtnPressed(sender: UIButton) {
        //insert code
    }
    
    @IBAction func onCategoryBtnPressed(sender: UIButton) {
    }
    
    
    
    
    
    @IBAction func createPostBtnPressed(sender: UIButton) {
        if titleField.text != "" && titleField.text != nil {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Card", inManagedObjectContext: context)!
            let card = Card(entity: entity, insertIntoManagedObjectContext: context)
            title = titleField.text
            card.cardTitle = titleField.text
            card.cardDescription = instructionTextView.text
            card.prepareCardImage(currentImage.image!)
//            titleField.hidden = true
//            styleButton.hidden = false
//            categoriesButton.hidden = false
            
            context.insertObject(card)
            
            do {
                try context.save()
                
            }catch{
                print("could not save the card")
            }
            dismissViewControllerAnimated(true, completion: nil)
            
        } else {
            
        }
        
        
        }
            
    

    
    
     //Custom button navBar
    
//    func transparentNavBar(){
//        let bar: UINavigationBar! = self.navigationController?.navigationBar
//        bar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        bar.shadowImage = UIImage()
//        bar.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.65)
//        locationView.backgroundColor = UIColor(white: 1, alpha: 0.3)
//    }
    
    func customRightBarButton(){
        let btn: UIButton = UIButton(type: UIButtonType.Custom)
        
        btn.setImage(UIImage(named: "cameranavbar"), forState: .Normal)
        btn.addTarget(self, action: #selector(onCameraTapped), forControlEvents: UIControlEvents.TouchUpInside)
        btn.frame = CGRectMake(0, 0, 27.5, 22)
        
        let barButton = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    
    
    //if I Need Shadow later - Shadow not working
    func setupLayer() {
        currentImage.layer.shadowColor = UIColor(red: shadowColor, green: shadowColor, blue: shadowColor, alpha: 1).CGColor
        currentImage.layer.shadowOffset = CGSizeMake(0, 2)
        currentImage.layer.shadowOpacity = 0.8
        currentImage.layer.shadowRadius = 5.0
        instructionTextView.layer.shadowColor = UIColor(red: shadowColor, green: shadowColor, blue: shadowColor, alpha: 1).CGColor
        instructionTextView.layer.shadowOffset = CGSizeMake(0, 2)
        instructionTextView.layer.shadowOpacity = 0.8
        instructionTextView.layer.shadowRadius = 5.0

        
    }
    
    
    
    
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
            background.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    }
