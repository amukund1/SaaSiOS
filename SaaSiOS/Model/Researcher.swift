//
//  Researcher.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/6/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

class Researcher {
    private var firstName: String
    private var lastName: String
    private var email: String
    private var affiliaton: String
    private var jobTitle: String
    
    init(firstName: String, lastName: String, email: String, affiliaton: String, jobTitle: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.affiliaton = affiliaton
        self.jobTitle = jobTitle
    }
    
    func getFirstName() -> String {
        return firstName
    }
    
    func getLastName() -> String {
        return lastName
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getAffiliation() -> String {
        return affiliaton
    }
    
    func getJobTitle() -> String {
        return jobTitle
    }
}
