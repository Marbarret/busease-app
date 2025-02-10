import AuthModule
import Models
import SwiftUI

public struct DependencyContainer {
    public static let shared = DependencyContainer()
    private init() {}

    public func provideAuthViewModel() -> AuthenticationViewModel {
        let authService = AuthenticationService()
        let userModel = UserModel()
        let verification = Verification()
        return AuthenticationViewModel(authService: authService, userModel: userModel, verificationModel: verification)
    }
}
