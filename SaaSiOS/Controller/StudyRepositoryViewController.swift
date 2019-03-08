//
//  StudyRepositoryViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/6/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class StudyRepositoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var selectedStudy: Study? = nil
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentState.getGlobalStudyList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "studyCell")
        selectedStudy = CurrentState.getGlobalStudyList()[indexPath.row]
        cell.textLabel?.text = selectedStudy!.getStudyName()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "studyInfoSegue", sender: self)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is StudyInformationViewController
        {
            let vc = segue.destination as? StudyInformationViewController
            vc?.setStudy(study: selectedStudy!)
        }
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
