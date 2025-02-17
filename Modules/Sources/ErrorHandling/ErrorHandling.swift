import Foundation

public enum ErrorHandling: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case httpError(statusCode: Int)
    case noData
    case decodingError(Error)
}

extension ErrorHandling: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid Credentials"
        case .networkError(_):
            return "Network Error"
        case .invalidResponse:
            return "Invalid Response"
        case .httpError(statusCode: let statusCode):
            return "HTTP Error \(statusCode)"
        case .noData:
            return "No Data"
        case .decodingError(_):
            return "Decoding Error"
        }
    }
}
