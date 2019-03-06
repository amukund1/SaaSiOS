//
//  ProfileViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileFirstName: UILabel!
    @IBOutlet weak var profileLastName: UILabel!
    @IBOutlet weak var profileBirthdate: UILabel!
    @IBOutlet weak var profileZipCode: UITextField!
    @IBOutlet weak var profileCountry: UITextField!
    @IBOutlet weak var profileEmail: UITextField!
    @IBOutlet weak var profilePassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sp = CurrentState.getStudyParticipant()

        profileFirstName.text = sp.getFirstName()
        profileLastName.text = sp.getLastName()
        profileBirthdate.text = sp.getBirthdate()
        profileZipCode.text = sp.getZipCode()
        profileCountry.text = sp.getCountry()
        profileEmail.text = sp.getEmail()
        profilePassword.text = sp.getPassword()
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
