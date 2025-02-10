import Foundation
import Combine
import Core
import Models
import ErrorHandling

@available(iOS 13.0, *)
public final class AuthenticationService {
    public init() {}
    
    public func registerUser(
        fullname: String,
        email: String,
        password: String) -> AnyPublisher<String?, ErrorHandling> {
        let requestBody = UserModel(
            role: "user",
            responsible: Responsible(
                fullName: fullname,
                email: email,
                document: Document(documentType: "", number: "")
            ),
            password: password
        )
        let request = NetworkRequest(
            endpoint: .register,
            method: .post,
            body: try? JSONEncoder().encode(requestBody),
            timeoutInterval: 60.0
        )
        return performRequest(request)
    }
    
    public func authenticate(
        email: String,
        password: String
    ) -> AnyPublisher<String?, ErrorHandling> {
        let requestBody = LoginRequestBodyAuth(email: email, password: password)
        let request = NetworkRequest(
            endpoint: .loginURL,
            method: .post,
            body: try? JSONEncoder().encode(requestBody),
            timeoutInterval: 60.0
        )
        return performRequest(request)
    }
    
    
    public func verifyAccount(email: String, verificationCode: String) -> AnyPublisher<String?, ErrorHandling> {
        let requestBody = VerificationCodeBody(email: email, verificationCode: verificationCode)
        let request = NetworkRequest(
            endpoint: .verify,
            method: .post,
            body: try? JSONEncoder().encode(requestBody),
            timeoutInterval: 60.0
        )
        return performRequest(request)
    }
    
    public func resendCode(email: String) -> AnyPublisher<String?, ErrorHandling> {
        let requestBody = ResendCodeBody(email: email)
        let request = NetworkRequest(
            endpoint: .resendCode,
            method: .post,
            body: try? JSONEncoder().encode(requestBody),
            timeoutInterval: 60.0
        )
        return performRequest(request)
    }
    
    private func performRequest(_ request: NetworkRequest) -> AnyPublisher<String?, ErrorHandling> {
        guard let url = URL(string: "\(URLManager().baseURL)"+"\(request.endpoint.rawValue)") else {
            return Fail(error: .invalidURL).eraseToAnyPublisher()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.timeoutInterval = request.timeoutInterval
        urlRequest.httpBody = request.body
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { result in
                guard let httpResponse = result.response as? HTTPURLResponse else {
                    throw ErrorHandling.invalidResponse
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    throw ErrorHandling.httpError(statusCode: httpResponse.statusCode)
                }
                
                return String(data: result.data, encoding: .utf8)
            }
            .mapError { error in
                error as? ErrorHandling ?? .networkError(error)
            }
            .eraseToAnyPublisher()
    }
}
