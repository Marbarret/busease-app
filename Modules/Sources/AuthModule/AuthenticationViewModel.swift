import SwiftUI
import Combine
import ErrorHandling
import Models

@available(iOS 13.0, *)
public final class AuthenticationViewModel: ObservableObject {
    private let authService: AuthenticationService
    public var cancellables: Set<AnyCancellable> = []
    @Published public var userModel: UserModel
    
    @Published public var authenticationResult: String?
    @Published public var errorMessage: String?
    @Published public var isLoggedIn: Bool = false
    @Published public var isLoading = false
    
    public init(authService: AuthenticationService, userModel: UserModel) {
        self.authService = authService
        self.userModel = userModel
    }
    
    public func registerUser(_ credentials: UserModel) {
        authService.registerUser(fullname: credentials.fullName, email: credentials.email, password: credentials.password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Erro ao registrar: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] result in
                self?.authenticationResult = result
            })
            .store(in: &cancellables)
    }
    
    public func authenticate(_ credentials: UserModel) {
        authService.authenticate(email: credentials.email, password: credentials.password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Erro de autenticação: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] result in
                self?.authenticationResult = result
                self?.isLoading = true
                self?.isLoggedIn = true
            })
            .store(in: &cancellables)
    }
}
