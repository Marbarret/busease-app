import Foundation

public struct LoginResponse: Codable {
    public let token: String?
    
    public init(token: String? = nil) {
        self.token = token
    }
}
