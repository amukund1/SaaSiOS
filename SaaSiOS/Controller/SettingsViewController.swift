//
//  SettingsViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

import OAuthSwift

class SettingsViewController: UIViewController {
    let auth: Authentication = CurrentState.getAuthentication()
    let database: DatabaseService = CurrentState.getDatabase()
    let fitbit: Fitbit = CurrentState.getFitbit()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logout(_ sender: UIButton) {
        auth.signOut()
        database.resetStudyParticipant()
    }
    
    @IBAction func connectFitbit(_ sender: UIButton) {
        fitbit.authorizeFitbit()
    }
}
