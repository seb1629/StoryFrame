//
//  CardModel.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 16/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class Post: NSObject {
    
    private var _cardTitle: String!
    private var _photoImgPath: String!
    private var _cardDesc: String!
    private var _textColor: UIColor?
    private var _cardColor: UIColor?
    private var _categories: String?
    private var _imageData: NSData?
    
    var cardTitle: String {
        return _cardTitle
    }
    
    var photoImgPath: String {
        return _photoImgPath
    }
    
    var cardDesc: String {
        return _cardDesc
    }
    
    var textColor: UIColor? {
        return _textColor
    }
    
    var cardcolor: UIColor? {
        return _cardColor
    }
    
    var categories: String? {
        return _categories
    }
    
    var imageData: NSData? {
        return _imageData
    }
    
    init(cardTitle: String, cardDesc: String, photoImgPath: String){
        self._cardTitle = cardTitle
        self._cardDesc = cardDesc
        self._photoImgPath = photoImgPath
    }
    
}
