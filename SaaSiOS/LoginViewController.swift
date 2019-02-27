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

    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeLogin(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: loginEmail.text!, password: loginPassword.text!) { (user, error) in
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
