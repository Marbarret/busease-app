import Foundation

public struct UserRegistrationBody: Codable {
    public let role: String
    public let responsible: Responsible
    public let password: String
    
    public init(role: String, responsible: Responsible, password: String) {
        self.role = role
        self.responsible = responsible
        self.password = password
    }
}

public struct Responsible: Codable {
    public let fullName: String
    public let email: String
    public let document: Document
    
    public init(fullName: String, email: String, document: Document) {
        self.fullName = fullName
        self.email = email
        self.document = document
    }
}

public struct Document: Codable {
    public let documentType: String
    public let number: String
    
    public init(documentType: String, number: String) {
        self.documentType = documentType
        self.number = number
    }
}
