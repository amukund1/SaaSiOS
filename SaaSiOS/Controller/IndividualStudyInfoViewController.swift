//
//  IndividualStudyInfoViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 4/16/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class IndividualStudyInfoViewController: UIViewController {
    private var study: Study? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func setStudy(study: Study) -> Void {
        self.study = study
    }
}
