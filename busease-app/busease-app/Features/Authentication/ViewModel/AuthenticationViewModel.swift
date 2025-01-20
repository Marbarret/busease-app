import Combine
import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @AppStorage ("authToken") private var authToken: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailValidationError: String? = nil
    @Published var passwordValidationError: String? = nil
    @Published var isLoggedIn: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        checkLoginStatus()
        setupValidation()
    }
    
    private func setupValidation() {
        Validations.shared
            .validatePublisher($email.eraseToAnyPublisher(), type: .email(.default))
            .assign(to: &$emailValidationError)
        
        Validations.shared
            .validatePublisher($password.eraseToAnyPublisher(), type: .password(.default))
            .assign(to: &$passwordValidationError)
    }
    
    func login() {
        guard emailValidationError == nil, passwordValidationError == nil else {
            errorMessage = "Por favor, corrija os erros antes de continuar."
            return
        }
        
        AuthenticationService.shared.authenticate(email: email, password: password)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = "Erro ao fazer login: \(error.localizedDescription)"
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] token in
                self?.isLoggedIn = true
            })
            .store(in: &cancellables)
    }
    
    func logout() {
        authToken = ""
        isLoggedIn = false
    }
    
    private func checkLoginStatus() {
        isLoggedIn = !authToken.isEmpty
    }
}
