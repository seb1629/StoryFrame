//
//  FavoriteCell.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 26/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
    @IBOutlet weak var myFav: UIImageView!
    
    var card: Card!
    
    func configureCell(card:Card) {
        self.card = card
        
        myFav.image = card.takeCardImage()
    }
}