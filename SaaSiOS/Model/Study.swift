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
    private var owner: Researcher
    private var id: String
    
    init(name: String, description: String, owner: Researcher, id: String) {
        self.name = name
        self.description = description
        self.owner = owner
        self.id = id
    }
    
    func getStudyName() -> String {
        return name
    }
    
    func getDescription() -> String {
        return description
    }
    
    func getOwner() -> Researcher {
        return owner
    }
    
    func getID() -> String {
        return id
    }
}
