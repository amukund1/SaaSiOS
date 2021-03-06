//
//  AccountVerificationViewController.swift
//  SaaSiOS
//

import UIKit

class AccountVerificationViewController: UIViewController {
    let auth: Authentication = CurrentState.getAuthentication()
    let database: DatabaseService = CurrentState.getDatabase()
    
    
    @IBOutlet weak var verificationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        verificationLabel.numberOfLines = 3
    }
    
    @IBAction func resendVerificationLink(_ sender: UIButton) {
        auth.sendVerificationLink()
        
        let alertController = UIAlertController(title: "A verification link has been sent.", message: "Please verify your account using the link sent to your email address.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        auth.signOut()
        
        if !auth.isSignedIn()
        {
            database.resetStudyParticipant()
            //self.performSegue(withIdentifier: "accountVerificationLogoutUnwindSegue", sender: sender)
        }
    }
}
