//
//  ViewController.swift
//  GoogleSigninProject
//
//  Created by 高倉楓麻 on 2019/12/03.
//  Copyright © 2019 高倉楓麻. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }


}

extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
          //エラーがnilでない場合
            print(error.localizedDescription)
            
            
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                          accessToken: authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
                
            } else {
                print("ログイン成功")
                self.performSegue(withIdentifier: "toHome", sender: nil)
            }
        }
        
        
    }
    
    
}
