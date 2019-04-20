//
//  Fitbit.swift
//  SaaSiOS
//


import OAuthSwift //https://github.com/OAuthSwift/OAuthSwift

class Fitbit {
    private var oauthswift: OAuth2Swift? = nil
    private var database: DatabaseService = CurrentState.getDatabase()
    
    /**
     Authorizes Fitbit with study participant's Fitbit credentials.
     */
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
                oauthswift.client.credential.oauthToken = credential.oauthToken
                oauthswift.client.credential.oauthTokenExpiresAt = Date(timeIntervalSinceNow: 3.154 * pow(10, 7))
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
    
    /**
     Retrieves Fitbit sleep data.
     */
    private func getSleepData()
    {
        getData(type: "sleep", resourceURL: "https://api.fitbit.com/1.2/user/-/sleep/date/today.json")
    }
    
    /**
     Retrieves Fitbit heart rate data.
     */
    private func getHeartRateData()
    {
        getData(type: "heart_rate", resourceURL: "https://api.fitbit.com/1/user/-/activities/heart/date/today/today.json")
    }
    
    /**
     Retrieves Fitbit activity data.
     */
    private func getActivity()
    {
        getData(type: "activity", resourceURL: "https://api.fitbit.com/1/user/-/activities/date/today.json")
    }
    
    /**
     Retrieves Fitbit weight data.
     */
    private func getWeight()
    {
        getData(type: "weight", resourceURL: "https://api.fitbit.com/1/user/-/body/log/weight/date/today.json")
    }
    
    /**
     Retrieves Fitbit nutrition data.
     */
    private func getNutrition()
    {
        getData(type: "nutrition", resourceURL: "https://api.fitbit.com/1/user/-/foods/log/date/today.json")
    }
    
    /**
     Retrieves Fitbit data.
     Parameters: Fitbit data type (weight, nutrition, etc.), Fitbit data type url
     */
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
