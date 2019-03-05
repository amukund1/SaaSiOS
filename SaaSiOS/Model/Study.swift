//
//  FirebaseDatabase.swift
//  SaaSiOS
//
//  Created by Adithya Mukund on 3/4/19.
//  Copyright © 2019 Adithya Mukund. All rights reserved.
//

class Study {
    private var name: String
    private var description: String
    private var owner: String
    private var ownerEmail: String
    private var affiliation: String
    private var jobTitle: String
    
    init(name: String, description: String, owner: String, ownerEmail: String, affiliation: String, jobTitle: String) {
        self.name = name
        self.description = description
        self.owner = owner
        self.ownerEmail = ownerEmail
        self.affiliation = affiliation
        self.jobTitle = jobTitle
    }
    
    func getStudyName() -> String {
        return name
    }
    
    func getDescription() -> String {
        return name
    }
    
    func getOwner() -> String {
        return owner
    }
    
    func getOwnerEmail() -> String {
        return ownerEmail
    }
    
    func getAffiliation() -> String {
        return affiliation
    }
    
    func getJobTitle() -> String {
        return jobTitle
    }
}
