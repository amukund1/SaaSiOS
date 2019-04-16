//
//  StudiesViewController.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 2/26/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import UIKit

class StudiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var selectedStudy: Study? = nil
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var welcomeMessage: UILabel!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentState.getIndividualStudyList().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "studyCell")
        cell.textLabel?.text = CurrentState.getIndividualStudyList()[indexPath.row].getStudyName()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStudy = CurrentState.getIndividualStudyList()[indexPath.row]
        performSegue(withIdentifier: "indivStudyInfoSegue", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeMessage.text = "Welcome " + CurrentState.getStudyParticipant().getFirstName() + "!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is IndividualStudyInfoViewController
        {
            let vc = segue.destination as? IndividualStudyInfoViewController
            vc?.setStudy(study: selectedStudy!)
        }
    }
    
    @IBAction func unwindToStudiesViewController(segue: UIStoryboardSegue) {
        
    }
}
