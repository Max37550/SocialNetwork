//
//  PostCell.swift
//  SocialNetwork
//
//  Created by Maxime Peralez on 27/03/2017.
//  Copyright © 2017 Maxime Peralez. All rights reserved.
//

import UIKit
import Firebase

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
    
    func configureCell(post: Post, img: UIImage? = nil) {
        self._post = post
        
        self.caption.text = self._post.caption
        self.likesLbl.text = "\(self._post.likes)"
        
        if img != nil {
            self.postImage.image = img
        } else {
            let ref = FIRStorage.storage().reference(forURL: _post.imageUrl)
            
            ref.data(withMaxSize: 2 * 1024 * 1024, completion: { (data, error) in
                if error != nil {
                    print("MAX : Unable to download image from Firebase Storage")
                } else {
                    print("MAX : Image downloaded from Firebase Storage")
                    if let imageData = data {
                        if let image = UIImage(data: imageData) {
                            self.postImage.image = image
                            FeedVC.imageCache.setObject(image, forKey: self._post.imageUrl as NSString)
                        }
                    }
                }
            })
        }
    }
    
}
