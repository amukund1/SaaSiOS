//
//  StudiesViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class StudiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentState.getIndividualStudyList().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "studyCell")
        cell.textLabel?.text = CurrentState.getIndividualStudyList()[indexPath.row].getStudyName()
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func unwindToStudiesViewController(segue: UIStoryboardSegue) {
        
    }
}
