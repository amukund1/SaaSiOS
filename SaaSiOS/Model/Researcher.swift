//
//  Researcher.swift
//  SaaSiOS
//

class Researcher {
    private var firstName: String
    private var lastName: String
    private var email: String
    private var affiliation: String
    private var jobTitle: String
    
    init(firstName: String, lastName: String, email: String, affiliation: String, jobTitle: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.affiliation = affiliation
        self.jobTitle = jobTitle
    }
    
    /**
     Retrieves first name of researcher.
     Returns: first name
     */
    func getFirstName() -> String {
        return firstName
    }
    
    /**
     Retrieves last name of researcher.
     Returns: last name
     */
    func getLastName() -> String {
        return lastName
    }
    
    /**
     Retrieves email of researcher.
     Returns: email
     */
    func getEmail() -> String {
        return email
    }
    
    /**
     Retrieves affiliation of researcher.
     Returns: affiliation
     */
    func getAffiliation() -> String {
        return affiliation
    }
    
    
    /**
     Retrieves job title of reseracher.
     Returns: job title
     */
    func getJobTitle() -> String {
        return jobTitle
    }
}
