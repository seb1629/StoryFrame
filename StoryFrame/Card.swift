//
//  Card.swift
//  
//
//  Created by SEBASTIEN MONTIBELLER on 19/06/2016.
//
//

import Foundation
import CoreData
import UIKit


class Card: NSManagedObject {

    func prepareCardImage(img: UIImage){
        let data = UIImagePNGRepresentation(img)
        self.cardImage = data
    }
    
    func takeCardImage() -> UIImage {
        let img = UIImage(data: self.cardImage!)!
        return img
    }

}
