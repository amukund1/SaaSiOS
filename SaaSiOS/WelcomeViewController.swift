//
//  WelcomeViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit
import FirebaseAuth

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            if Auth.auth().currentUser!.isEmailVerified
            {
                self.performSegue(withIdentifier: "resumeVerifiedUseSegue", sender: self)
            }
            else
            {
                self.performSegue(withIdentifier: "resumeUnverifiedUseSegue", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is LoginViewController
        {
            let vc = segue.destination as? LoginViewController
            vc?.emailText = welcomeEmail.text!
        }
    }
    
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "beginLoginSegue", sender: self)
    }
    
    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
        
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
