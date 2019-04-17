//
//  StudyParticipant.swift
//  SaaSiOS
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
    
    /**
     Retrieves first name of study participant.
     Returns: first name
    */
    func getFirstName() -> String {
        return firstName
    }
    
    /**
     Retrieves last name of study participant.
     Returns: last name
     */
    func getLastName() -> String {
        return lastName
    }
    
    /**
     Retrieves birth date of study participant.
     Returns: birth date
     */
    func getBirthdate() -> String {
        return birthdate
    }
    
    /**
     Retrieves zip code of study participant.
     Returns: zip code
     */
    func getZipCode() -> String {
        return zipCode
    }
    
    
    /**
     Sets zip code of study participant.
     Parameters: zip code
     */
    func setZipCode(zipCode: String) -> Void {
        self.zipCode = zipCode
    }
    
    
    /**
     Retrieves country of study participant.
     Returns: country
     */
    func getCountry() -> String {
        return country
    }
    
    /**
     Sets country of study participant.
     Parameters: country
     */
    func setCountry(country: String) -> Void {
        self.country = country
    }
    
    
    /**
     Retrieves email of study participant.
     Returns: email
     */
    func getEmail() -> String {
        return email
    }
    
    /**
     Sets email of study participant.
     Parameters: email
     */
    func setEmail(email: String) -> Void {
        self.email = email
    }
    
    
    /**
     Retrieves password of study participant.
     Parameters: password
     */
    func getPassword() -> String {
        return password
    }
}
