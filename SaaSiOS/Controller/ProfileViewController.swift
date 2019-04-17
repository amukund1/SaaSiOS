//
//  ProfileViewController.swift
//  SaaSiOS
//

import UIKit

class ProfileViewController: UIViewController {
    let database: DatabaseService = CurrentState.getDatabase()
    let auth: Authentication = CurrentState.getAuthentication()
    
    let sp = CurrentState.getStudyParticipant()
    
    @IBOutlet weak var profileFirstName: UILabel!
    @IBOutlet weak var profileLastName: UILabel!
    @IBOutlet weak var profileBirthdate: UILabel!
    @IBOutlet weak var profileZipCode: UITextField!
    @IBOutlet weak var profileCountry: UITextField!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileFirstName.text = sp.getFirstName()
        profileLastName.text = sp.getLastName()
        profileBirthdate.text = sp.getBirthdate()
        profileZipCode.text = sp.getZipCode()
        profileCountry.text = sp.getCountry()
    }
    

    @IBAction func updateProfile(_ sender: UIButton) {
        sp.setZipCode(zipCode: profileZipCode.text!)
        sp.setCountry(country: profileCountry.text!)
        database.addStudyParticipant(studyParticipant: sp, userID: auth.getUserID())
        
        let alertController = UIAlertController(title: "Profile Updated!", message: "You successfully updated your profile.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
        self.present(alertController, animated: true, completion: nil)
    }
}
