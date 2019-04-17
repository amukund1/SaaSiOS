//
//  CurrentState.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/5/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import OAuthSwift

class CurrentState {
    private static let authentication: Authentication = FirebaseAuthentication()
    private static let database: DatabaseService = FirebaseDatabaseService()
    private static var studyParticipant: StudyParticipant? = nil
    private static var globalStudyList: [Study]? = nil
    private static var individualStudyList: [Study]? = nil
    private static var fitbit: Fitbit = Fitbit()
    
    /**
     Retrieves the Authentication instance used by current instance of app.
    */
    static func getAuthentication() -> Authentication {
        return authentication
    }
    
    /**
     Retrieves the DatabaseService instance used by current instance of app.
     */
    static func getDatabase() -> DatabaseService {
        return database
    }
    
    /**
     Retrieves the StudyParticipant currently using the app.
     */
    static func getStudyParticipant() -> StudyParticipant {
        return studyParticipant!
    }
    
    /**
     Saves the StudyParticipant currently using the app.
     
     Precondition: studyParticipant != nil
     */
    static func setStudyParticipant(studyParticipant: StudyParticipant?) -> Void {
        self.studyParticipant = studyParticipant
    }
    
    /**
     Retrieves the list of all studies that the current StudyParticipant can join.
     */
    static func getGlobalStudyList() -> [Study] {
        return globalStudyList!
    }
    
    /**
     Saves the list of all studies that the current StudyParticipant can join.
     */
    static func setGlobalStudyList(globalStudyList: [Study]) -> Void {
        self.globalStudyList = globalStudyList
    }
    
    /**
     Retrieves the list of all studies that the current StudyParticipant has already joined.
     */
    static func getIndividualStudyList() -> [Study] {
        return individualStudyList!
    }
    
    /**
     Saves the list of all studies that the current StudyParticipant can join.
     */
    static func setIndividualStudyList(individualStudyList: [Study]) -> Void {
        self.individualStudyList = individualStudyList
    }
    
    /**
     Retrieves the Fitbit instance used by the current instance of the app.
     */
    static func getFitbit() -> Fitbit {
        return fitbit
    }
}
