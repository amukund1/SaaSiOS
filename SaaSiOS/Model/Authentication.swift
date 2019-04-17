//
//  Authentication.swift
//  SaaSiOS
//

protocol Authentication {
    
    /**
     Signs in the study participant into the app.
     Parameters: email, password, completion handler
    */
    func signIn(email: String, password: String, completion: @escaping(Error?) -> Void)
    
    /**
     Registers the study participant for the app.
     Parameters: study participant, completion handler
     */
    func register(studyParticipant: StudyParticipant, completion: @escaping(Error?) -> Void)
    
    /**
     Signs out the study participant from the app.
     */
    func signOut() -> Void
    
    /**
     Determines whether or not the study participant is signed into the app.
     Returns: true if study participant is signed in, false if not
     */
    func isSignedIn() -> Bool
    
    /**
     Determines whether or not the study participant has verified his or her account.
     Returns: true if study participant has verified his or her account, false if not
     */
    func isVerified() -> Bool
    
    /**
     Resets the password for the study participant.
     Parameters: email
     */
    func resetPassword(email: String) -> Void
    
    /**
     Sends verification link to the study participant's email
     */
    func sendVerificationLink() -> Void
    
    /**
     Retrieves the user id of the study participant.
     Returns: user id
     */
    func getUserID() -> String
}
