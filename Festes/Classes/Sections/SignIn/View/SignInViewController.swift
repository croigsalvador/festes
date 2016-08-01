//
//  SignInViewController.swift
//  Festes
//
//  Created by Carlos Roig on 01/08/16.
//  Copyright © 2016 Festes. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonPressed: UIButton!
    
    let newtworkProvider : UserNetworkProvider = UserNetworkProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func signInButtonAction(sender: UIButton) {
        
        if let email = self.emailTextField.text, password = self.passwordTextField.text {
            newtworkProvider.createUserWithEmailAndPassword(email, password: password, completion: { (user, error) in
                if user != nil {
                    self.navigationController?.pushViewController(MapViewController(), animated: true)
                }
            })
        }
        
        
    }
}
