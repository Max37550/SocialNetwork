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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            return cell
        } else {
            return UITableViewCell()
        }*/
        return tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
    }

    @IBAction func signOutBtnPressed(_ sender: Any) {

        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("MAX : Keychain ID removed \(keychainResult)")
        
        try! FIRAuth.auth()?.signOut()
        
        dismiss(animated: true, completion: nil)
    }
}
