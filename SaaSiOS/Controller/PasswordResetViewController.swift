//
//  PasswordResetViewController.swift
//  SaaSiOS
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
