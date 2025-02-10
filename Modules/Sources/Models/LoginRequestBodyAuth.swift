import Foundation

public struct LoginRequestBodyAuth: Codable {
    public let email: String
    public let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

public struct ResendCodeBody: Codable {
    public let email: String
    public init(email: String) {
        self.email = email
    }
}

public struct VerificationCodeBody: Codable {
    public var email: String
    public var verificationCode: String
    
    public init(email: String, verificationCode: String) {
        self.email = email
        self.verificationCode = verificationCode
    }
}
