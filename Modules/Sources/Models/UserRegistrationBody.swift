import Foundation

public struct UserModel: Codable {
    public var role: String
    public var responsible: Responsible
    public var password: String
    public var dependent: [Dependent]?
    public var isVerified: Bool
    public var verification: Verification?
    public var terms: Bool?
    public var biometrics: Biometrics?
    
    public init(role: String = "user", responsible: Responsible = Responsible(), password: String = "", dependent: [Dependent]? = nil, isVerified: Bool = false, verification: Verification? = nil, terms: Bool? = nil, biometrics: Biometrics? = nil) {
        self.role = role
        self.responsible = responsible
        self.password = password
        self.dependent = dependent
        self.isVerified = isVerified
        self.verification = verification
        self.terms = terms
        self.biometrics = biometrics
    }
}

public struct Responsible: Codable {
    public var fullName: String
    public var genericName: String?
    public var email: String
    public var contact: String?
    public var document: Document?
    public var address: Address?
    public var photo: String?
    
    public init(fullName: String = "", genericName: String? = nil, email: String = "",
        contact: String? = nil, document: Document? = nil, address: Address? = nil, photo: String? = nil) {
        self.fullName = fullName
        self.genericName = genericName
        self.email = email
        self.contact = contact
        self.document = document
        self.address = address
        self.photo = photo
    }
}

public struct Document: Codable {
    public var documentType: String
    public var number: String
    
    public init(documentType: String = "", number: String = "") {
        self.documentType = documentType
        self.number = number
    }
}

public struct Address: Codable {
    public var street: String?
    public var city: String?
    public var zipCode: String?
    public var state: String?
    
    public init(street: String? = nil, city: String? = nil, zipCode: String? = nil, state: String? = nil) {
        self.street = street
        self.city = city
        self.zipCode = zipCode
        self.state = state
    }
}

public struct Verification: Codable {
    public var method: String
    public var code: String
    
    public init(method: String = "", code: String = "") {
        self.method = method
        self.code = code
    }
}

public struct Biometrics: Codable {
    public let enabled: Bool
    public let identifier: String?
    
    public init(enabled: Bool = false, identifier: String? = nil) {
        self.enabled = enabled
        self.identifier = identifier
    }
}

public struct Dependent: Codable {
    public let name: String
    public let relationship: String
    
    public init(name: String, relationship: String) {
        self.name = name
        self.relationship = relationship
    }
}
