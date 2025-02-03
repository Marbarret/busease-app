import Foundation

public enum ErrorHandling: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case httpError(statusCode: Int)
    case noData
    case decodingError(Error)
}
