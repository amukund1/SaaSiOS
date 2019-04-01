//
//  RegisterDeviceViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 4/1/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

import OAuthSwift

class RegisterDeviceViewController: UIViewController {
    private var oauthswift: OAuth2Swift?;

    override func viewDidLoad() {
        super.viewDidLoad()

        authenticateFitbit()
    }
    
    //be wary - the goal is to establish the connection in the view controller
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey  : Any] = [:]) -> Bool {
        if (url.host == "oauth-callback") {
            OAuthSwift.handle(url: url)
        }
        return true
    }
    
    private func authenticateFitbit() {
        oauthswift = OAuth2Swift(
            consumerKey:    "22DGF7",
            consumerSecret: "547af9c314011e8a2cf87ffd20fc0541",
            authorizeUrl:   "https://www.fitbit.com/oauth2/authorize",
            accessTokenUrl: "https://api.fitbit.com/oauth2/token",
            responseType:   "code"
        )
        let handle = oauthswift!.authorize(
            withCallbackURL: URL(string: "oauth-swift://oauth-callback/instagram")!,
            scope: "likes+comments", state:"INSTAGRAM",
            success: { credential, response, parameters in
                print(credential.oauthToken)
                //perform request
                self.getFitbitUser()
        },
            failure: { error in
                print(error.localizedDescription)
        }
        )
    }
    
    private func getFitbitUser() {
        let _ = oauthswift!.client.get(
            "https://www.fitbit.com/user/79WRWH",
            parameters: [:],
            success: { response in
                let jsonDict = try? response.jsonObject()
                print(jsonDict as Any)
        },
            failure: { error in
                print(error.description)
        }
        )
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
