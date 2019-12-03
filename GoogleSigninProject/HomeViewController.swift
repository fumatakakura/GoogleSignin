//
//  HomeViewController.swift
//  GoogleSigninProject
//
//  Created by 高倉楓麻 on 2019/12/03.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = Auth.auth().currentUser!
        
        emailLabel.text = user.email
        nameLabel.text = user.displayName
        
        let data = try! Data(contentsOf: user.photoURL!)
        
        let image = UIImage(data: data)
        
        imageView.image = image
        
    }
    



}
