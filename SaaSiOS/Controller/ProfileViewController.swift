//
//  ProfileViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    private var profileFirstNameText: String = "";
    private var profileLastNameText: String = "";
    private var profileBirthdateText: String = "";
    private var profileZipCodeText: String = "";
    private var profileCountryText: String = "";
    private var profileEmailText: String = "";
    private var profilePasswordText: String = "";
    
    @IBOutlet weak var profileFirstName: UILabel!
    @IBOutlet weak var profileLastName: UILabel!
    @IBOutlet weak var profileBirthdate: UILabel!
    @IBOutlet weak var profileZipCode: UITextField!
    @IBOutlet weak var profileCountry: UITextField!
    @IBOutlet weak var profileEmail: UITextField!
    @IBOutlet weak var profilePassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
