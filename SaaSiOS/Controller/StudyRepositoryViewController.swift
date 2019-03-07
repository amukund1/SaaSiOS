//
//  StudyRepositoryViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/6/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class StudyRepositoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentState.getGlobalStudyList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "studyCell")
        cell.textLabel?.text = CurrentState.getGlobalStudyList()[indexPath.row].getStudyName()
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
