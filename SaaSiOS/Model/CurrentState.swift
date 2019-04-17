//
//  CurrentState.swift
//  SaaSiOS
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
     Returns: the authentication instance
    */
    static func getAuthentication() -> Authentication {
        return authentication
    }
    
    /**
     Retrieves the DatabaseService instance used by current instance of app.
     Returns: the database instance
     */
    static func getDatabase() -> DatabaseService {
        return database
    }
    
    /**
     Retrieves the StudyParticipant currently using the app.
     Returns: the study particant who is using the app
     */
    static func getStudyParticipant() -> StudyParticipant {
        return studyParticipant!
    }
    
    /**
     Saves the StudyParticipant currently using the app.
     
     Precondition: studyParticipant != nil
     Parameters: the study participant who is using the app
     */
    static func setStudyParticipant(studyParticipant: StudyParticipant?) -> Void {
        self.studyParticipant = studyParticipant
    }
    
    /**
     Retrieves the list of all studies that the current StudyParticipant can join.
     Returns: the list of all studies available to join
     */
    static func getGlobalStudyList() -> [Study] {
        return globalStudyList!
    }
    
    /**
     Saves the list of all studies that the current StudyParticipant can join.
     Parameters: the list of all studies available to join.
     */
    static func setGlobalStudyList(globalStudyList: [Study]) -> Void {
        self.globalStudyList = globalStudyList
    }
    
    /**
     Retrieves the list of all studies that the current StudyParticipant has already joined.
     Returns: the list of all studies that the current StudyParticipant has already joined.
     */
    static func getIndividualStudyList() -> [Study] {
        return individualStudyList!
    }
    
    /**
     Saves the list of all studies that the current StudyParticipant has already joined.
     Parameters: the list of all studies that the current StudyParticipant has already joined
     */
    static func setIndividualStudyList(individualStudyList: [Study]) -> Void {
        self.individualStudyList = individualStudyList
    }
    
    /**
     Retrieves the Fitbit instance used by the current instance of the app.
     Returns: the current Fitbit instance
     */
    static func getFitbit() -> Fitbit {
        return fitbit
    }
}
