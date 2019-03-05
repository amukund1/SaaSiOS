//
//  StudyParticipant.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/2/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

class StudyParticipant {
    private var firstName: String
    private var lastName: String
    private var birthdate: String
    private var zipCode: String
    private var country: String
    private var email: String
    private var password: String
    
    init(firstName: String, lastName: String, birthdate: String, zipCode: String, country: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.zipCode = zipCode
        self.country = country
        self.email = email
        self.password = password
    }
    
    func getFirstName() -> String {
        return firstName
    }
    
    func getLastName() -> String {
        return lastName
    }
    
    func getBirthdate() -> String {
        return birthdate
    }
    
    func getZipCode() -> String {
        return zipCode
    }
    
    func setZipCode(zipCode: String) -> Void {
        self.zipCode = zipCode
    }
    
    func getCountry() -> String {
        return country
    }
    
    func getEmail() -> String {
        return email
    }
    
    func setEmail(email: String) -> Void {
        self.email = email
    }
    
    func getPassword() -> String {
        return password
    }
    
    func setPassword(password: String) -> Void {
        self.password = password
    }
}
