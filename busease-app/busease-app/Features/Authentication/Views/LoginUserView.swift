import SwiftUI

struct LoginUserView: View {
    @StateObject private var authViewModel = AuthenticationViewModel()
    @State private var document = ""
    @State private var password = ""
    @State private var navigateToHome = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Documento", text: $document)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Senha", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    authViewModel.login(document: document, password: password)
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                Spacer()
                NavigationLink(destination: RegisterUserView()) {
                    Text("Cadastrar Usuário")
                        .foregroundColor(.blue)
                        .padding()
                }
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
                NavigationLink(
                    destination: ContentView(),
                    isActive: $authViewModel.isLoggedIn
                ) {
                    Text("")
                        .frame(width: 0, height: 0)
                }
                .hidden()
            }
            .navigationTitle("Login")
            .padding()
        }
    }
}
