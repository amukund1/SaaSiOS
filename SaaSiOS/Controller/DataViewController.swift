//
//  DataViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

import OAuthSwift

class DataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func jsonSleepData(_ sender: UIButton) {
        getSleepData()
    }
    
    
     private func getSleepData() {
         CurrentState.getOAuthSwift().client.get(
             "https://api.fitbit.com/1.2/user/-/sleep/list.json?beforeDate=2019-03-27&sort=desc&offset=0&limit=1",
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
}
