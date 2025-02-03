import Foundation

public struct NetworkRequest {
    public var endpoint: Endpoint
    public var method: HTTPMethod
    public var headers: [String: String]?
    public var body: Data?
    public var timeoutInterval: TimeInterval
    
    public static var defaultHeaders: [String: String] {
        ["Content-Type": "application/json"]
    }
    
    public init(endpoint: Endpoint, method: HTTPMethod, headers: [String : String]? = defaultHeaders, body: Data? = nil, timeoutInterval: TimeInterval) {
        self.endpoint = endpoint
        self.method = method
        self.headers = headers
        self.body = body
        self.timeoutInterval = timeoutInterval
    }
}

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum Endpoint: String {
    case loginURL = "auth/login"
    case register = "/bse"
    case guardianChangePassword = "/guardian/change-password"
    case forgetPassword = "/forget-password"
    case waitingCode = "/waiting-code"
}

extension NetworkRequest {
//    public var headers: [String: String]? {
//        return ["Content-Type": "application/json"]
//    }
//
//    public var timeoutInterval: TimeInterval {
//        return 60.0
//    }
}

