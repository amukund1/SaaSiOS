//
//  ProfileViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    let database: DatabaseService = CurrentState.getDatabase()
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
    }
}
