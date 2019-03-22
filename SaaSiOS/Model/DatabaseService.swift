//
//  Database.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/2/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

protocol DatabaseService {
    func addStudyParticipant(studyParticipant: StudyParticipant, userID: String) -> Void
    
    func retrieveStudyParticipant(userID: String, completion: @escaping(Error?) -> Void)
    
    func resetStudyParticipant() -> Void
    
    func retrieveGlobalStudyList(completion: @escaping(Error?) -> Void)
    
    func joinStudy(userID: String, studyID: String)
    
    func retrieveIndividualStudyList(userID: String, completion: @escaping(Error?) -> Void)
}
