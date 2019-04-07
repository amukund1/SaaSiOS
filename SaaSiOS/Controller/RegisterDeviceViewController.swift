//
//  RegisterDeviceViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 4/1/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

import OAuthSwift

import SafariServices

class RegisterDeviceViewController: UIViewController {
    private var oauthswift: OAuth2Swift?

    override func viewDidLoad() {
        super.viewDidLoad()

        authenticateFitbit()
        getSleepData()
    }
    
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
        oauthswift!.accessTokenBasicAuthentification = true
        
        //oauthswift!.authorizeURLHandler = getURLHandler()
        
        let state = generateState(withLength: 20)
        
        //success closure not executing
        let _ = oauthswift!.authorize(
            withCallbackURL: URL(string: "https://www.fitbit.com/user/79WRWH")!, scope: "heartrate sleep", state: state,
            success: { credential, response, parameters in
                self.printTokenAlert(credential: credential)
            },
            failure: { error in
                print(error.description)
            }
        )
    }
    /*
    private func getURLHandler() -> OAuthSwiftURLHandlerType {
        let handler = SafariURLHandler(viewController: self, oauthSwift: oauthswift!)
        handler.factory = { url in
            return SFSafariViewController(url: url)
        }
        
        return handler
    }*/
    
    private func getSleepData() {
        let _ = oauthswift!.client.get(
            "https://api.fitbit.com/1.2/user/-/sleep/list.json",
            parameters: [:],
            success: { response in
                let jsonDict = try? response.jsonObject()
                print("sleep data")
                print(jsonDict as Any)
        },
            failure: { error in
                print(error.description)
        }
        )
    }
    
    private func printTokenAlert(credential: OAuthSwiftCredential) {
        var message = "oauth_token:\(credential.oauthToken)"
        if !credential.oauthTokenSecret.isEmpty {
            message += "\n\noauth_token_secret:\(credential.oauthTokenSecret)"
        }
        print(message)
    }

}
