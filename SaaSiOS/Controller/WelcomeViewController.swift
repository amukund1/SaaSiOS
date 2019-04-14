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
                        self.database!.retrieveGlobalStudyList() { error in
                            if error != nil
                            {
                                print(error?.localizedDescription)
                            }
                        }
                        
                        self.database!.retrieveIndividualStudyList(userID: self.auth!.getUserID()) { error in
                            if error != nil
                            {
                                print(error?.localizedDescription)
                            }
                            else
                            {
                                self.performSegue(withIdentifier: "resumeVerifiedUseSegue", sender: self)
                            }
                        }
                        
                        if CurrentState.getIndividualStudyList().count == 0
                        {
                            self.performSegue(withIdentifier: "resumeVerifiedUseSegue", sender: self)
                        }
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
    
    @IBAction func unwindToWelcomeViewController(segue: UIStoryboardSegue) {
        
    }
}
