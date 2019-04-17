//
//  Database.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/2/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

protocol DatabaseService {
    /**
     This method adds a study participant to the database.
     */
    func addStudyParticipant(studyParticipant: StudyParticipant, userID: String) -> Void
    
    /**
     This method retrives the study participant from the database.
     */
    func retrieveStudyParticipant(userID: String, completion: @escaping(Error?) -> Void)
    
    /**
     This method resets the study participant using the current instance of the app.
     */
    func resetStudyParticipant() -> Void
    
    /**
     This method retrieves the list of all studies that a study participant can join from the database.
     */
    func retrieveGlobalStudyList(completion: @escaping(Error?) -> Void)
    
    /**
     This method allows a study participant to join a study.
     */
    func joinStudy(userID: String, studyID: String)
    
    /**
     This method adds a study participant to the database.
     */
    func retrieveIndividualStudyList(userID: String, completion: @escaping(Error?) -> Void)
    
    func addFitbitData(type: String, data: Any) -> Void
}
