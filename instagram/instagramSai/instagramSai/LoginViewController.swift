//
//  LoginViewController.swift
//  instagramSai
//
//  Created by Saikiran Komatineni on 4/8/19.
//  Copyright © 2019 saikiran. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
    
        PFUser.logInWithUsername(inBackground: username.text!, password: password.text!) { (success, error) in
            if (success != nil) {
                print("login success")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let user = PFUser()
        user.username = username.text
        user.password = password.text
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("Sign in successful")
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
}
