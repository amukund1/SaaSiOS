//
//  FirebaseDatabase.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/2/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import FirebaseDatabase

class FirebaseDatabaseService : DatabaseService {
    let auth = CurrentState.getAuthentication()
    
    var ref: DatabaseReference!
    var globalListHandle: DatabaseHandle?
    var indivListHandle: DatabaseHandle?
    
    init() {
        ref = Database.database().reference()
    }
    
    func addStudyParticipant(studyParticipant: StudyParticipant, userID: String) -> Void {
        let spInfo = [
            "firstName": studyParticipant.getFirstName(),
            "lastName": studyParticipant.getLastName(),
            "birthdate": studyParticipant.getBirthdate(),
            "zipcode": studyParticipant.getZipCode(),
            "country": studyParticipant.getCountry(),
            "email": studyParticipant.getEmail(),
        ]
        
        CurrentState.setStudyParticipant(studyParticipant: studyParticipant)
        self.ref.child("study_participant").child(userID).setValue(spInfo)
    }
    
    func retrieveStudyParticipant(userID: String, completion: @escaping(Error?) -> Void) {
        ref.child("study_participant").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            let firstName = value?["firstName"] as? String ?? ""
            let lastName = value?["lastName"] as? String ?? ""
            let birthdate = value?["birthdate"] as? String ?? ""
            let country = value?["country"] as? String ?? ""
            let zipCode = value?["zipcode"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            
            let sp = StudyParticipant(firstName: firstName, lastName: lastName, birthdate: birthdate, zipCode: zipCode, country: country, email: email, password: "")
            
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
        globalListHandle = ref?.child("study").observe(.childAdded, with: { snapshot in
            let studyID = snapshot.key
            if let study = snapshot.value as? NSDictionary
            {
                let status = study["status"] as? String
                
                if status == "active"
                {
                    let name = study["studyName"] as? String ?? ""
                    let description = study["description"] as? String ?? ""
                    let ownerID = study["owner"] as? String ?? ""
                    
                    self.retrieveOwner(ownerID: ownerID) { owner in
                        let studyObject = Study(name: name, description: description, owner: owner!, id: studyID)
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
            let affiliation = owner?["affiliation"] as? String ?? ""
            let jobTitle = owner?["jobTitle"] as? String ?? ""
            
            let ownerResearcher = Researcher(firstName: firstName, lastName: lastName, email: email, affiliation: affiliation, jobTitle: jobTitle)
            
            completion(ownerResearcher)
        })
    }
    
    func joinStudy(userID: String, studyID: String) -> Void {
        self.ref.child("study_participant").child(userID).child("studies").child(String(studyID.hash)).setValue(studyID)
        self.ref.child("study").child(studyID).child("participants").child(userID).setValue(true)
    }
    
    
    func retrieveIndividualStudyList(userID: String, completion: @escaping(Error?) -> Void) {
        var indivStudyList = [Study]()
        indivListHandle = ref?.child("study_participant").child(userID).child("studies").observe(.childAdded, with: { snapshot in
            if let studyID = snapshot.value as? NSString
            {
                self.retrieveStudy(studyID: studyID as String, completion: { study in
                    indivStudyList.append(study!)
                    CurrentState.setIndividualStudyList(individualStudyList: indivStudyList)
                    completion(nil)
                })
            }
        }) { error in
            completion(error)
        }
        
        CurrentState.setIndividualStudyList(individualStudyList: indivStudyList)
    }
    
    private func retrieveStudy(studyID: String, completion: @escaping(Study?) -> Void) {
        ref.child("study").child(studyID).observeSingleEvent(of: .value, with: { snapshot in
            let study = snapshot.value as? NSDictionary
            
            let name = study?["studyName"] as? String ?? ""
            let description = study?["description"] as? String ?? ""
            let ownerID = study?["owner"] as? String ?? ""
            
            self.retrieveOwner(ownerID: ownerID) { owner in
                let studyObject = Study(name: name, description: description, owner: owner!, id: studyID)
                completion(studyObject)
            }
        })
    }
    
    func addFitbitData(type: String, data: Any) -> Void {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let todayFormatted = dateFormatter.string(from: today)
        print(todayFormatted)
        self.ref.child("study_participant").child(auth.getUserID()).child("fitbit_data").child(todayFormatted).child(type).setValue(data)
    }
}
