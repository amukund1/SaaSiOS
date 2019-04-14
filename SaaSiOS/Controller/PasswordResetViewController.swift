//
//  PasswordResetViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class PasswordResetViewController: UIViewController {
    let auth: Authentication = CurrentState.getAuthentication()
    
    @IBOutlet weak var passwordResetEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        auth.resetPassword(email: passwordResetEmail.text!)
    }
}
