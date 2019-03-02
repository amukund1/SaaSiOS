//
//  Authentication.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/1/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

import FirebaseAuth

class FirebaseAuthentication : Authentication {
    func signIn(email : String, password : String) -> Void {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            //responsibility of controller to do segues
        }
    }
    
    func createUser(email: String, password: String, completion: @escaping(Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil && user != nil
            {
                completion(nil)
            }
            else
            {
                completion(error)
            }
        }
    }
    
    func signOut() -> Void {
        do
        {
            try Auth.auth().signOut()
            print("Logout succeeded");
        }
        catch
        {
            print("Logout failed");
        }
    }
    
    func isSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func isVerified() -> Bool {
        return Auth.auth().currentUser != nil && Auth.auth().currentUser!.isEmailVerified
    }
    
    
    func resetPassword(email: String) -> Void {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            
            //email regex check needed
        }
    }
    
    func sendVerificationLink() -> Void {
        Auth.auth().currentUser?.sendEmailVerification {
            (error) in
        }
    }
}
