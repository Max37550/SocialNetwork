//
//  CircleImageView.swift
//  SocialNetwork
//
//  Created by Maxime Peralez on 27/03/2017.
//  Copyright © 2017 Maxime Peralez. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.cornerRadius = self.frame.width / 2
    }

}
