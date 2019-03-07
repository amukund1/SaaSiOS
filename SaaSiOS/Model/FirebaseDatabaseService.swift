//
//  FirebaseDatabase.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/2/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import FirebaseDatabase

class FirebaseDatabaseService : DatabaseService {
    var ref: DatabaseReference!
    var handle: DatabaseHandle?
    
    init() {
        ref = Database.database().reference()
    }
    
    func addStudyParticipant(studyParticipant: StudyParticipant, userID: String) -> Void {
        let spInfo = [
            "first_name": studyParticipant.getFirstName(),
            "last_name": studyParticipant.getLastName(),
            "date_of_birth": studyParticipant.getBirthdate(),
            "zipcode": studyParticipant.getZipCode(),
            "country": studyParticipant.getCountry(),
            "email": studyParticipant.getEmail(),
            "password": studyParticipant.getPassword()
        ]
        
        CurrentState.setStudyParticipant(studyParticipant: studyParticipant)
        self.ref.child("study_participant").child(userID).setValue(spInfo)
    }
    
    func retrieveStudyParticipant(userID: String, completion: @escaping(Error?) -> Void) {
        ref.child("study_participant").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            let firstName = value?["first_name"] as? String ?? ""
            let lastName = value?["last_name"] as? String ?? ""
            let birthdate = value?["birthdate"] as? String ?? ""
            let country = value?["country"] as? String ?? ""
            let zipCode = value?["zipcode"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            let password = value?["password"] as? String ?? ""
            
            let sp = StudyParticipant(firstName: firstName, lastName: lastName, birthdate: birthdate, zipCode: zipCode, country: country, email: email, password: password)
            
            CurrentState.setStudyParticipant(studyParticipant: sp)
            
            completion(nil)
        }) { error in
            completion(error)
        }
    }
    
    func resetStudyParticipant() -> Void {
        CurrentState.setStudyParticipant(studyParticipant: nil)
    }
    
    func retrieveGlobalStudyList(completion: @escaping([Study]) -> Void) {
        var globalStudyList = [Study]()
        handle = ref?.child("study").observe(.childAdded, with: { snapshot in
            print("handler entered")
            if let study = snapshot.value as? NSDictionary
            {
                let status = study["status"] as? String
                
                if status == "active"
                {
                    let name = study["name"] as? String
                    let description = study["desc"] as? String
                    
                    let owner = study["owner"] as? NSDictionary
                    let ownerFirstName = owner?["firstName"] as? String ?? "Owner First Name"
                    let ownerLastName = owner?["lastName"] as? String ?? "Owner First Name"
                    let ownerEmail = owner?["email"] as? String ?? "Owner Email"
                    let ownerAffiliation = owner?["firstName"] as? String ?? "Owner Affiliation"
                    let ownerJobTitle = owner?["firstName"] as? String ?? "Owner Job Title"
                    
                    let ownerResearcher = Researcher(firstName: ownerFirstName, lastName: ownerLastName, email: ownerEmail, affiliaton: ownerAffiliation, jobTitle: ownerJobTitle)
                    
                    let studyObject = Study(name: name!, description: description!, owner: ownerResearcher)
                    
                    globalStudyList.append(studyObject)
                }
            }
            completion(globalStudyList)
        })
    }
}
