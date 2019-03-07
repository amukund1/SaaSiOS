//
//  WelcomeViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    var auth: Authentication? = nil
    var database: DatabaseService? = nil
    
    @IBOutlet weak var welcomeEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        auth = CurrentState.getAuthentication()
        database = CurrentState.getDatabase()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if auth!.isSignedIn() {
            let userID = self.auth!.getUserID()
            
            self.database!.retrieveStudyParticipant(userID: userID) { (databaseError) in
                if databaseError == nil
                {
                    if self.auth!.isVerified()
                    {
                        self.performSegue(withIdentifier: "resumeVerifiedUseSegue", sender: self)
                    }
                    else
                    {
                        self.performSegue(withIdentifier: "resumeUnverifiedUseSegue", sender: self)
                    }
                }
                else
                {
                    let alertController = UIAlertController(title: "Login Error", message: databaseError?.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is LoginViewController
        {
            let vc = segue.destination as? LoginViewController
            vc?.setEmailText(emailText: welcomeEmail.text!)
        }
    }
    
    @IBAction func login(_ sender: Any) {
        if welcomeEmail.text!.count > 0
        {
            self.performSegue(withIdentifier: "beginLoginSegue", sender: self)
        }
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