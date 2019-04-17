//
//  Authentication.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/1/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

protocol Authentication {
    
    /**
     signs in the study participant into the app
    */
    func signIn(email: String, password: String, completion: @escaping(Error?) -> Void)
    
    /**
     registers the study participant for the app
     */
    func register(studyParticipant: StudyParticipant, completion: @escaping(Error?) -> Void)
    
    /**
     signs out the study participant from the app
     */
    func signOut() -> Void
    
    /**
     returns whether or not the study participant is signed into the app
     */
    func isSignedIn() -> Bool
    
    /**
     returns whether or not the study participant has verified his or her account
     */
    func isVerified() -> Bool
    
    /**
     resets the password for the study participant
     */
    func resetPassword(email: String) -> Void
    
    /**
     sends verification link to the study participant's email
     */
    func sendVerificationLink() -> Void
    
    /**
     returns the user id of the study participant
     */
    func getUserID() -> String
}
