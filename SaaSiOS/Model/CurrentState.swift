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
    private static var globalStudyList: [Study]? = nil
    
    static func getAuthentication() -> Authentication {
        return authentication
    }
    
    static func getDatabase() -> DatabaseService {
        return database
    }
    
    static func getStudyParticipant() -> StudyParticipant {
        return studyParticipant!
    }
    
    static func setStudyParticipant(studyParticipant: StudyParticipant?) -> Void {
        self.studyParticipant = studyParticipant
    }
    
    static func getGlobalStudyList() -> [Study] {
        return globalStudyList!
    }
    
    static func setGlobalStudyList(globalStudyList: [Study]) -> Void {
        self.globalStudyList = globalStudyList
    }
}