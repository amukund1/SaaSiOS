//
//  AccountVerificationViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/28/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit
import FirebaseAuth

class AccountVerificationViewController: UIViewController {

    @IBOutlet weak var verificationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        verificationLabel.numberOfLines = 3
    }
    
    @IBAction func resendVerificationLink(_ sender: UIButton) {
        Auth.auth().currentUser?.sendEmailVerification {
            (error) in
        }
        
        let alertController = UIAlertController(title: "A verification link has been sent.", message: "Please verify your account using the link sent to your email address.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        do
        {
            try Auth.auth().signOut()
            print("Logout succeeded");
            self.performSegue(withIdentifier: "accountVerificationLogoutUnwindSegue", sender: sender)
        }
        catch
        {
            print("Logout failed");
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
