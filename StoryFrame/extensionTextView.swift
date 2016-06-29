//
//  extensionTextView.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 17/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import Foundation


extension UITextView: UITextViewDelegate {
    
    // Placeholder text
    var placeholder: String? {
        
        get {
            // Get the placeholder text from the label
            var placeholderText: String?
            
            if let placeHolderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeHolderLabel.text
            }
            return placeholderText
        }
        
        set {
            // Store the placeholder text in the label
            let placeHolderLabel = self.viewWithTag(100) as? UILabel
            if placeHolderLabel == nil {
                // Add placeholder label to text view
                self.addPlaceholderLabel(newValue!)
            }
            else {
                placeHolderLabel?.text = newValue
                placeHolderLabel?.sizeToFit()
            }
        }
    }
    
    // Hide the placeholder label if there is no text
    // in the text viewotherwise, show the label
    public func textViewDidChange(textView: UITextView) {
        
        let placeHolderLabel = self.viewWithTag(100)
        
        if !self.hasText() {
            // Get the placeholder label
            placeHolderLabel?.hidden = false
        }
        else {
            placeHolderLabel?.hidden = true
        }
    }
    
    // Add a placeholder label to the text view
    func addPlaceholderLabel(placeholderText: String) {
        
        // Create the label and set its properties
        let placeholderLabel = UILabel()
        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()
        placeholderLabel.frame.origin.x = 12.0
        placeholderLabel.frame.origin.y = 5.0
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1.0)
        placeholderLabel.tag = 100
        
        // Hide the label if there is text in the text view
        //placeholderLabel.hidden = (countElements(self.text) > 0)
        
        self.addSubview(placeholderLabel)
        self.delegate = self;
    }
    
    public func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = range.rangeForString(currentText) else { return false }
        
        let changedText = currentText.stringByReplacingCharactersInRange(stringRange, withString: text)
        
        return changedText.characters.count <= 400
    }

    
}


extension NSRange {
    func rangeForString(str: String) -> Range<String.Index>? {
        guard location != NSNotFound else { return nil }
        return str.startIndex.advancedBy(location) ..< str.startIndex.advancedBy(location + length)
    }
}
