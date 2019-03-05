//
//  CurrentState.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/5/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

class CurrentState {
    private static let authentication: Authentication = FirebaseAuthentication()
    private static let database: DatabaseService = FirebaseDatabaseService()
    private static var studyParticipant: StudyParticipant? = nil
    
    static func getAuthentication() -> Authentication {
        return authentication
    }
    
    static func getDatabase() -> DatabaseService {
        return database
    }
    
    static func getStudyParticipant() -> StudyParticipant {
        return studyParticipant!
    }
    
    static func setStudyParticipant(studyParticipant: StudyParticipant) -> StudyParticipant {
        return studyParticipant
    }
}
