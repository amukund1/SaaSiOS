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
    
    func addStudyParticipant(sp: StudyParticipant) -> Void {
        self.ref.child("study_participant").childByAutoId().setValue(["first_name": sp.getFirstName(), "last_name": sp.getLastName(), "date_of_birth": sp.getBirthdate(), "zipcode": sp.getZipCode(), "country": sp.getCountry(), "email": sp.getEmail(), "password": sp.getPassword()])
    }
}
