//
//  PostCell.swift
//  SocialNetwork
//
//  Created by Maxime Peralez on 27/03/2017.
//  Copyright © 2017 Maxime Peralez. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var likesLbl : UILabel!
    
    private var _post: Post!
    
    var post: Post {
        return _post
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post) {
        self._post = post
        
        self.caption.text = self._post.caption
        self.likesLbl.text = "\(self._post.likes)"
    }
    
}
