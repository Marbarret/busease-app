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
    @Published public var isSuccess: Bool = false
    @Published public var isLoading = false
    
    public init(authService: AuthenticationService, userModel: UserModel) {
        self.authService = authService
        self.userModel = userModel
    }
    
    public func registerUser(_ credentials: UserModel) {
        authService.registerUser(fullname: credentials.responsible.fullName, email: credentials.responsible.email, password: credentials.password)
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
                self?.isSuccess = true
            })
            .store(in: &cancellables)
    }
    
    public func authenticate(_ credentials: UserModel) {
        authService.authenticate(email: credentials.responsible.email, password: credentials.password)
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
                self?.isSuccess = true
            })
            .store(in: &cancellables)
    }
    
    public func verifyAccount(_ email: String, code: String) {
        authService.verifyAccount(email: email, verificationCode: code)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.errorMessage = "Erro de autenticação: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] result in
                self?.isSuccess = true
                self?.isLoading = true
            })
            .store(in: &cancellables)
    }
    
    public func resendCode(_ credential: UserModel) {
        authService.resendCode(email: credential.responsible.email)
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
                self?.isSuccess = true
                print("Reenvio de código bem-sucedido!")
            })
            .store(in: &cancellables)
    }
}
