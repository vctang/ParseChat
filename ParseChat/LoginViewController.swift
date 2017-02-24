//
//  ViewController.swift
//  ParseChat
//
//  Created by Vicky Tang on 2/23/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLoginButton(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!){
            (user: PFUser?, error: Error?) -> Void in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            } else {
                print("error: Could not perform segue. Invalid User")
            }
        }

    }
    
    @IBAction func onSignUpButton(_ sender: Any) {
        var user = PFUser()
        user.email = emailTextField.text
        user.username = emailTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground { (suceeded: Bool, error: Error?) in
            if let error = error{
                let errorString = error.localizedDescription as? NSString
            } else {
                // Hooray! Let them use the app now.
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            }
        }

    }

}

