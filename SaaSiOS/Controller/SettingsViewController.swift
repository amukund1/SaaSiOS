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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: UIButton) {
        auth.signOut()
        database.resetStudyParticipant()
    }
    
    @IBAction func connectFitbit(_ sender: UIButton) {
        authorizeFitbit()
    }
    
    
    private func authorizeFitbit() {
        let oauthswift = OAuth2Swift(
            consumerKey:    "22DGF7",
            consumerSecret: "547af9c314011e8a2cf87ffd20fc0541",
            authorizeUrl:   "https://www.fitbit.com/oauth2/authorize",
            accessTokenUrl: "https://api.fitbit.com/oauth2/token",
            responseType:   "code"
        )
        oauthswift.accessTokenBasicAuthentification = true
        
        CurrentState.setOAuthSwift(oauthswift: oauthswift)
        
        let state = generateState(withLength: 20)
        
        oauthswift.authorize(
            withCallbackURL: URL(string: "SaaSiOS://oauth-callback")!, scope: "profile", state: state,
            success: { (credential, response, parameters) in
                print("successful authorization")
                ///get access token from here
            },
            failure: { error in
                print(error.description)
            }
        )
    }

}
