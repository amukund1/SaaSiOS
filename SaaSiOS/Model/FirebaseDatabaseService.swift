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
        
        self.ref.child("study_participant").child(userID).setValue(spInfo)
        CurrentState.setStudyParticipant(studyParticipant: studyParticipant)
    }
}
