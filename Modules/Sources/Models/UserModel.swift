import Foundation

public struct UserModel: Codable {
    public var email: String
    public var password: String
    public var fullName: String
    
    public init(email: String = "", password: String = "", fullName: String = "") {
        self.email = email
        self.password = password
        self.fullName = fullName
    }
}
