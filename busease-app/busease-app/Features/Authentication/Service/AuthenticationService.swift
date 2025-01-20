import SwiftUI
import Combine

class URLManager {
    static let shared = URLManager()
    private init() {}
    
    let baseURL = "http://localhost:3000/busease-api/v1/"
    
    let loginURL = "auth/login"
    let signupURL = "/signup"
    let guardianChangePassword = "/guardian/change-password"
    let forgetPassword = "/forget-password"
    let waitingCode = "/waiting-code"
    
    func makeURL(path: String) -> URL? {
        guard let fullURL = URL(string: baseURL + path) else {
            return nil
        }
        return fullURL
    }
}

struct LoginResponse: Codable {
    let accessToken: String?
}

struct LoginRequestBodyAuth: Codable {
    let email: String
    let password: String
}


class AuthenticationService {
    static let shared = AuthenticationService()
    private init() {}
    
    func authenticate(email: String, password: String) -> AnyPublisher<String, AuthenticationError> {
        guard let url = URLManager.shared.makeURL(path: URLManager.shared.loginURL) else {
            return Fail(error: AuthenticationError.failedToEncode).eraseToAnyPublisher()
        }
        
        let body = LoginRequestBodyAuth(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            return Fail(error: AuthenticationError.failedToEncode).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result -> String in
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: result.data)
                guard let token = loginResponse.accessToken else {
                    throw AuthenticationError.invalidCredentials
                }
                return token
            }
            .mapError { error in
                error as? AuthenticationError ?? .noData
            }
            .eraseToAnyPublisher()
    }
}
