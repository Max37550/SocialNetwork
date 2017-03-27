//
//  FeedVC.swift
//  SocialNetwork
//
//  Created by Maxime Peralez on 27/03/2017.
//  Copyright © 2017 Maxime Peralez. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func signOutBtnPressed(_ sender: Any) {

        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("MAX : Keychain ID removed \(keychainResult)")
        
        try! FIRAuth.auth()?.signOut()
        
        dismiss(animated: true, completion: nil)
    }
}
