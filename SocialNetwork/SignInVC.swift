//
//  ViewController.swift
//  SocialNetwork
//
//  Created by Maxime Peralez on 25/03/2017.
//  Copyright © 2017 Maxime Peralez. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func facebookBtnPressed(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            
            if error != nil {
                print("MAX : Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("MAX : User cancelled Facebook authentication")
            } else {
                print("MAX : Succesfully authenticated with Facebook")
                
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (result, error) in
            
            if error != nil {
                print("MAX : Unable to authenticate with Firebase - \(error)")
            } else {
                print("MAX : Succesfully authenticated with Firebase")
            }
        })
    }

}

