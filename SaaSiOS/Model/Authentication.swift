//
//  Authentication.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/1/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

protocol Authentication {
    func signIn(email: String, password: String, completion: @escaping(Error?) -> Void)
    
    func createStudyParticipant(email: String, password: String, completion: @escaping(Error?) -> Void)
    
    func signOut() -> Void
    
    func isSignedIn() -> Bool
    
    func isVerified() -> Bool
    
    func resetPassword(email: String) -> Void
    
    func sendVerificationLink() -> Void
    
    func getUserID() -> String
}
