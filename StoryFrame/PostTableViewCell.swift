//
//  PostTableViewCell.swift
//  StoryFrame
//
//  Created by SEBASTIEN MONTIBELLER on 15/06/2016.
//  Copyright © 2016 SEBASTIEN MONTIBELLER. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDesc: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurePost(post: Post){
        postTitle.text = post.cardTitle
        //postDesc.text = post.cardDesc
        //postImage.image = post.photoImgPath
    }

}
