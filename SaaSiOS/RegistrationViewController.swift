//
//  RegistrationViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegistrationViewController: UIViewController {
    var ref : DatabaseReference!
    
    @IBOutlet weak var registrationFirstName: UITextField!
    @IBOutlet weak var registrationLastName: UITextField!
    @IBOutlet weak var registrationBirthdate: UITextField!
    @IBOutlet weak var registrationZipCode: UITextField!
    @IBOutlet weak var registrationEmail: UITextField!
    @IBOutlet weak var registrationPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
    }
    
    @IBAction func completeRegistration(_ sender: UIButton) {
        if !areAllFieldsComplete()
        {
            return
        }
        
        //create user injected public method firebase database model
        Auth.auth().createUser(withEmail: registrationEmail.text!, password: registrationPassword.text!) { (user, error) in
            if error == nil && user != nil
            {
                print("User Created");
                
                Auth.auth().currentUser?.sendEmailVerification {
                    (error) in
                }
                
                //injected private method to enter into database TBD
                /*
                self.ref.child("Participants").childByAutoId().setValue(["Email": self.registrationEmail.text])*/
                
                self.performSegue(withIdentifier: "completeRegistrationSegue", sender: sender)
            }
            else {
                print("Error creating user: \(error!.localizedDescription)")
                let alertController = UIAlertController(title: "Registration Error", message: error!.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    private func areAllFieldsComplete() -> Bool
    {
        return isFirstNameFieldComplete() && isLastNameFieldComplete() && isBirthdateFieldComplete() && isZipcodeComplete() && isEmailFieldComplete() && isPasswordFieldComplete()
    }
    
    private func isFirstNameFieldComplete() -> Bool
    {
        return registrationFirstName.text!.count > 0
    }
    
    private func isLastNameFieldComplete() -> Bool
    {
        return registrationLastName.text!.count > 0
    }
    
    private func isBirthdateFieldComplete() -> Bool
    {
        return registrationBirthdate.text!.count > 0
    }
    
    private func isZipcodeComplete() -> Bool
    {
        return registrationZipCode.text!.count > 0
    }
    
    private func isEmailFieldComplete() -> Bool
    {
        return registrationEmail.text!.count > 0
    }
    
    /* https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift */
    private func isEmailFormatted() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: registrationEmail.text)
    }
    
    private func isPasswordFieldComplete() -> Bool
    {
        return registrationPassword.text!.count > 0
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
