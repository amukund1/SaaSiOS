//
//  LoginViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    var emailText : String = ""
    @IBOutlet weak var loginEmail: UILabel!
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginEmail.text = emailText
    }
    
    @IBAction func completeLogin(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: loginEmail.text!, password: loginPassword.text!) { (user, error) in
            let isLoginSuccessful = error == nil && user != nil
            
            if isLoginSuccessful
            {
                self.performSegue(withIdentifier: "completeLoginSegue", sender: sender)
            }
            else {
                let alert = UIAlertController(title: "Login Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}