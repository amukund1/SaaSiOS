//
//  LoginViewController.swift
//  SaaSiOS
//

import UIKit

class LoginViewController: UIViewController {
    let auth: Authentication = CurrentState.getAuthentication()
    let database: DatabaseService = CurrentState.getDatabase()
    
    private var emailText : String = ""
    @IBOutlet weak var loginEmail: UILabel!
    @IBOutlet weak var loginPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginEmail.text = emailText
    }
    
    @IBAction func completeLogin(_ sender: UIButton) {
        self.auth.signIn(email: self.loginEmail.text!, password: self.loginPassword.text!) { authError in
            if authError == nil
            {
                let userID = self.auth.getUserID()
                
                self.database.retrieveStudyParticipant(userID: userID) { (databaseError) in
                    if databaseError == nil
                    {
                        if self.auth.isVerified()
                        {
                            
                            self.database.retrieveGlobalStudyList() { error in
                                if error != nil
                                {
                                    print(error?.localizedDescription)
                                }
                            }
                            
                            self.database.retrieveIndividualStudyList(userID: self.auth.getUserID()) { error in
                                if error != nil
                                {
                                    print(error?.localizedDescription)
                                }
                                else
                                {
                                    self.performSegue(withIdentifier: "completeVerifiedLoginSegue", sender: self)
                                }
                            }
                            
                            if CurrentState.getIndividualStudyList().count == 0
                            {
                                self.performSegue(withIdentifier: "completeVerifiedLoginSegue", sender: self)
                            }
                        }
                        else
                        {
                            self.performSegue(withIdentifier: "completeUnverifiedLoginSegue", sender: sender)
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
            else
            {
                let alertController = UIAlertController(title: "Login Error", message: authError?.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        self.performSegue(withIdentifier: "resetPasswordSegue", sender: sender)
    }
    
    func setEmailText(emailText: String) -> Void {
        self.emailText = emailText
    }
}
