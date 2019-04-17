//
//  Database.swift
//  SaaSiOS
//

protocol DatabaseService {
    /**
     Adds a study participant to the database.
     Parameters: study participant, user id
     */
    func addStudyParticipant(studyParticipant: StudyParticipant, userID: String) -> Void
    
    /**
     Retrieves the study participant from the database.
     Parameters: user id, completion handler
     */
    func retrieveStudyParticipant(userID: String, completion: @escaping(Error?) -> Void)
    
    /**
     Resets the study participant using the current instance of the app.
     */
    func resetStudyParticipant() -> Void
    
    /**
     This method retrieves the list of all studies that a study participant can join from the database.
     Parameters: completion handler
     */
    func retrieveGlobalStudyList(completion: @escaping(Error?) -> Void)
    
    /**
     This method allows a study participant to join a study.
     Parameters: user id, study id
     */
    func joinStudy(userID: String, studyID: String)
    
    /**
     This method adds a study participant to the database.
     Parameters: user id, completion handler
     */
    func retrieveIndividualStudyList(userID: String, completion: @escaping(Error?) -> Void)
    
    /**
     This method adds fitbit data to the database.
     Parameters: fitbit data type (weight, nutrition, etc.), fitbit data
     */
    func addFitbitData(type: String, data: Any) -> Void
}
