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
    
    func retrieveGlobalStudyList(completion: @escaping(Error?) -> Void) {
        var globalStudyList = [Study]()
        handle = ref?.child("study").observe(.childAdded, with: { snapshot in
            print("handler entered")
            if let study = snapshot.value as? NSDictionary
            {
                let status = study["status"] as? String
                
                if status == "active"
                {
                    let name = study["name"] as? String ?? ""
                    let description = study["desc"] as? String ?? ""
                    let ownerID = study["owner"] as? String ?? ""
                    
                    self.retrieveOwner(ownerID: ownerID) { owner in
                        let studyObject = Study(name: name, description: description, owner: owner!)
                        globalStudyList.append(studyObject)
                        CurrentState.setGlobalStudyList(globalStudyList: globalStudyList)
                        completion(nil)
                    }
                }
            }
        }) { error in
            completion(error)
        }
    }
    
    private func retrieveOwner(ownerID: String, completion: @escaping(Researcher?) -> Void) {
        ref.child("researchers").child(ownerID).observeSingleEvent(of: .value, with: { (snapshot) in
            let owner = snapshot.value as? NSDictionary
            
            let firstName = owner?["firstName"] as? String ?? ""
            let lastName = owner?["lastName"] as? String ?? ""
            let email = owner?["email"] as? String ?? ""
            let affiliation = owner?["affiliation"] as? String ?? "TBD"
            let jobTitle = owner?["jobTitle"] as? String ?? "TBD"
            
            let ownerResearcher = Researcher(firstName: firstName, lastName: lastName, email: email, affiliation: affiliation, jobTitle: jobTitle)
            
            completion(ownerResearcher)
        })
    }
    
    func joinStudy(userID: String, studyID: String) -> Void {
        self.ref.child("study_participant").child(userID).child("studies").setValue(studyID)
    }
    
    /*
    func retrieveIndividualStudyList(userID: String, completion: @escaping(Error?) -> Void) {
        ref.child("study_participant").child(userID).child("studies").observeSingleEvent(of: .value, with: { (snapshot) in
            let studyIDs = snapshot.value as? NSArray
            
            //studies will be array of IDs, so retrieve the studies themselves and add the list to the current state
            
            let individualStudyList = NSMutableArray(array: studies!)
            let actualIndivStudyList = individualStudyList.flatMap({ $0 as? String })
            CurrentState.setIndividualStudyList(individualStudyList: actualIndivStudyList)
            completion(nil)
        }) { error in
            completion(error)
        }
    }*/
}
