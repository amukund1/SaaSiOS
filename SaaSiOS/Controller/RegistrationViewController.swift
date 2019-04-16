//
//  RegistrationViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    let auth: Authentication = CurrentState.getAuthentication()
    let database: DatabaseService = CurrentState.getDatabase()
    
    @IBOutlet weak var registrationFirstName: UITextField!
    @IBOutlet weak var registrationLastName: UITextField!
    @IBOutlet weak var registrationBirthdate: UITextField!
    @IBOutlet weak var registrationZipCode: UITextField!
    @IBOutlet weak var registrationCountry: UITextField!
    @IBOutlet weak var registrationEmail: UITextField!
    @IBOutlet weak var registrationPassword: UITextField!
    @IBOutlet weak var registrationConfirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func completeRegistration(_ sender: UIButton) {
        if !areAllFieldsComplete()
        {
            return
        }
        
        if !isBirthdateFormatted()
        {
            let alertController = UIAlertController(title: "Improperly Formatted Birthdate", message: "Please format your birthdate as mm/dd/yy.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if !isEmailFormatted()
        {
            let alertController = UIAlertController(title: "Improperly Formatted Email", message: "Please format your email properly.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if !arePasswordsEqual()
        {
            let alertController = UIAlertController(title: "Passwords don't Match", message: "Please make sure your passwords match.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if !isOfAge()
        {
            let alertController = UIAlertController(title: "You are ineligible to register.", message: "You must be at least 19 years old.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let sp = StudyParticipant(firstName: registrationFirstName.text!, lastName: registrationLastName.text!, birthdate: registrationBirthdate.text!, zipCode: registrationZipCode.text!, country: registrationCountry.text!, email: registrationEmail.text!, password: registrationPassword.text!)
        
        auth.register(studyParticipant: sp) { error in
            if error == nil
            {
                self.auth.sendVerificationLink()
                
                let userID = self.auth.getUserID()
                self.database.addStudyParticipant(studyParticipant: sp, userID: userID)
                
                self.performSegue(withIdentifier: "completeRegistrationSegue", sender: sender)
            }
            else
            {
                let alertController = UIAlertController(title: "Registration Error", message: error?.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    private func areAllFieldsComplete() -> Bool
    {
        return isFirstNameFieldComplete() && isLastNameFieldComplete() && isBirthdateFieldComplete() && isZipcodeFieldComplete() && isCountryFieldComplete() && isEmailFieldComplete() && isPasswordFieldComplete() && isConfirmPasswordFieldComplete()
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
    
    private func isZipcodeFieldComplete() -> Bool
    {
        return registrationZipCode.text!.count > 0
    }
    
    private func isCountryFieldComplete() -> Bool
    {
        return registrationCountry.text!.count > 0
    }
    
    private func isEmailFieldComplete() -> Bool
    {
        return registrationEmail.text!.count > 0
    }
    
    /* Source for Email Regex: https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift */
    private func isEmailFormatted() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: registrationEmail.text)
    }
    
    /* Source for Date Regex: https://stackoverflow.com/questions/50005129/swift-regex-for-finding-date-in-string */
    private func isBirthdateFormatted() -> Bool {
        let dateRegex = "[0-9]{1,2}(/)[0-9]{1,2}(/)[0-9]{4}"
        let dateTest = NSPredicate(format:"SELF MATCHES %@", dateRegex)
        return dateTest.evaluate(with: registrationBirthdate.text)
    }
    
    /* Source for Age Calculation: https://stackoverflow.com/questions/49966369/calculate-age-from-birth-date-using-textfield-and-nsdatecomponents-in-swift4 */
    private func isOfAge() -> Bool {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        let birthdayDate = dateFormater.date(from: registrationBirthdate.text!)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age! >= 19
    }
    
    private func isPasswordFieldComplete() -> Bool
    {
        return registrationPassword.text!.count > 0
    }
    
    private func isConfirmPasswordFieldComplete() -> Bool
    {
        return registrationConfirmPassword.text!.count > 0
    }

    private func arePasswordsEqual() -> Bool
    {
        return registrationPassword.text! == registrationConfirmPassword.text!
    }
}
