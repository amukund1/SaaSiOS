//
//  RegistrationViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {

    
    @IBOutlet weak var registrationEmail: UITextField!
    @IBOutlet weak var registrationPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeRegistration(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: registrationEmail.text!, password: registrationEmail.text!) { (user, error) in
            if error == nil && user != nil
            {
                print("User Created");
            }
            else
            {
                print("Error creating user: \(error!.localizedDescription)");
                let alertController = UIAlertController(title: "Email already in use.", message: error!.localizedDescription, preferredStyle: .alert)
                
                
                self.present(alertController, animated: true, completion: nil)
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
