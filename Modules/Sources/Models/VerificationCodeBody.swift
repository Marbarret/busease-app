import Foundation

public struct VerificationCodeBody: Codable {
    public var email: String
    public var verificationCode: String
    
    public init(email: String, verificationCode: String) {
        self.email = email
        self.verificationCode = verificationCode
    }
}
