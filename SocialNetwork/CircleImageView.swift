//
//  CircleImageView.swift
//  SocialNetwork
//
//  Created by Maxime Peralez on 27/03/2017.
//  Copyright © 2017 Maxime Peralez. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }

}
