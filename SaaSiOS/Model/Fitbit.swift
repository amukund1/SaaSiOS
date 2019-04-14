//
//  Fitbit.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 4/13/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//


import OAuthSwift

class Fitbit {
    private var oauthswift: OAuth2Swift? = nil
    private var database: DatabaseService = CurrentState.getDatabase()
    
    func authorizeFitbit() {
        let oauthswift = OAuth2Swift(
            consumerKey:    "22DGF7",
            consumerSecret: "547af9c314011e8a2cf87ffd20fc0541",
            authorizeUrl:   "https://www.fitbit.com/oauth2/authorize",
            accessTokenUrl: "https://api.fitbit.com/oauth2/token",
            responseType:   "code"
        )
        self.oauthswift = oauthswift
        
        self.oauthswift!.accessTokenBasicAuthentification = true
        
        let state = generateState(withLength: 20)
        
        self.oauthswift!.authorize(
            withCallbackURL: URL(string: "SaaSiOS://oauth-callback")!, scope: "sleep heartrate weight activity nutrition", state: state,
            success: { (credential, response, parameters) in
                /*
                let alertController = UIAlertController(title: "Fitbit Sync Complete", message: "Your Fitbit has synchronized successfully.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
                self.present(alertController, animated: true, completion: nil)
                */
                
                oauthswift.client.credential.oauthToken = credential.oauthToken
                oauthswift.client.credential.oauthTokenExpiresAt = Date(timeIntervalSinceNow: 86400)
                oauthswift.client.credential.oauthTokenSecret = credential.oauthTokenSecret
                
                self.getSleepData()
                self.getHeartRateData()
                self.getActivity()
                self.getWeight()
                self.getNutrition()
        },
            failure: { error in
                print(error.description)
        }
        )
    }
    
    private func getSleepData()
    {
        getData(type: "sleep", resourceURL: "https://api.fitbit.com/1.2/user/-/sleep/date/today.json")
    }
    
    private func getHeartRateData()
    {
        getData(type: "heart_rate", resourceURL: "https://api.fitbit.com/1/user/-/activities/heart/date/today/today.json")
    }
    
    private func getActivity()
    {
        getData(type: "activity", resourceURL: "https://api.fitbit.com/1/user/-/activities/date/today.json")
    }
    
    private func getWeight()
    {
        getData(type: "weight", resourceURL: "https://api.fitbit.com/1/user/-/body/log/weight/date/today.json")
    }
    
    private func getNutrition()
    {
        getData(type: "nutrition", resourceURL: "https://api.fitbit.com/1/user/-/foods/log/date/today.json")
    }
    
    private func getData(type: String, resourceURL: String)
    {
        self.oauthswift!.client.get(
            resourceURL,
            parameters: [:],
            success: { response in
                let jsonDict = try? response.jsonObject()
                self.database.addFitbitData(type: type, data: jsonDict!)
        },
            failure: { error in
                print(error.description)
        }
        )
    }

}
