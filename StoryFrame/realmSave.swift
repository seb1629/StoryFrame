//
//  realmSave.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 17/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import Foundation
import RealmSwift

class Card: Object {
    dynamic var cardTitle = ""
    dynamic var cardDescription: String?
    //dynamic var cardImage: //path
}