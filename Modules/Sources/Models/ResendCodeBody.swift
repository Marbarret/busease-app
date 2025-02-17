import Foundation

public struct ResendCodeBody: Codable {
    public let email: String
    public init(email: String) {
        self.email = email
    }
}
