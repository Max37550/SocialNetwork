//
//  SignInVC.swift
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
    
    @IBOutlet weak var emailAddressLbl: FancyField!
    @IBOutlet weak var passwordLbl: FancyField!
    
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

    @IBAction func signInBtnPressed(_ sender: Any) {
        
        if let email = emailAddressLbl.text , let password = passwordLbl.text {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                //User already exists
                if error == nil {
                    print("MAX : User authenticated with Firebase")
                } else {
                    //Otherwise, create a new user
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("MAX : Unable to authenticate with Firebase using email")
                        } else {
                            print("MAX : Successfully authenticated with Firebase")
                        }
                    })
                }
            })
        }
    }
    
}
