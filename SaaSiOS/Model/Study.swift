//
//  FirebaseDatabase.swift
//  SaaSiOS
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
    
    /**
     Retrieves study name.
     Returns: study name
     */
    func getStudyName() -> String {
        return name
    }
    
    /**
     Retrieves study descrption.
     Returns: study description
     */
    func getDescription() -> String {
        return description
    }
    
    /**
     Retrieves study owner.
     Returns: study owner
     */
    func getOwner() -> Researcher {
        return owner
    }
    
    /**
     Retrieves study id.
     Returns: study id
     */
    func getID() -> String {
        return id
    }
}
