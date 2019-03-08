//
//  StudyInformationViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/8/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class StudyInformationViewController: UIViewController {
    
    private var study: Study? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setStudy(study: Study) -> Void {
        self.study = study
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
