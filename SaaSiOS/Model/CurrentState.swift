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
    private static var oauthswift: OAuth2Swift?
    
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
    
    static func getIndividualStudyList() -> [Study] {
        return individualStudyList!
    }
    
    static func setIndividualStudyList(individualStudyList: [Study]) -> Void {
        self.individualStudyList = individualStudyList
    }
    
    static func getOAuthSwift() -> OAuth2Swift {
        return oauthswift!
    }
    
    static func setOAuthSwift(oauthswift: OAuth2Swift) -> Void {
        self.oauthswift = oauthswift
    }
}
