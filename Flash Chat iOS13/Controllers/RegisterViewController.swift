//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.errorLabel.text = K.blank
        self.errorLabel.textColor = UIColor.clear
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                    self.errorLabel.numberOfLines = 0
                    self.errorLabel.text = e.localizedDescription
                    self.errorLabel.textColor = UIColor.systemRed
                } else {
                    self.errorLabel.textColor = UIColor.clear
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            } 
        }
    }
    
}
