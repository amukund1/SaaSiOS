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
    
    
    @IBOutlet weak var studyName: UILabel!
    @IBOutlet weak var studyDescription: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var ownerJobTitle: UILabel!
    @IBOutlet weak var ownerEmail: UILabel!
    @IBOutlet weak var ownerAffiliation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studyName.text = study?.getStudyName()
        studyDescription.text = study?.getDescription()
        
        let owner = study?.getOwner()
        
        let ownerFirstName = owner?.getFirstName()
        let ownerLastName = owner?.getLastName()
        
        ownerName.text = ownerFirstName
        ownerName.text!.append(" ")
        ownerName.text!.append(ownerLastName!)
        
        ownerJobTitle.text = owner?.getJobTitle()
        ownerEmail.text = owner?.getEmail()
        ownerAffiliation.text = owner?.getAffiliation()
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
