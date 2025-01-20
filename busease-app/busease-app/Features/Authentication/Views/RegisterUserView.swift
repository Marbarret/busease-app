import SwiftUI

struct RegisterUserView: View {
    @StateObject private var authViewModel = AuthenticationViewModel()
    @State private var fullName = ""
    @State private var documentType = "CPF"
    @State private var documentNumber = ""
    @State private var password = ""
    @State private var showError = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Nome Completo", text: $fullName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Tipo de Documento", text: $documentType)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Número do Documento", text: $documentNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Senha", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if validateFields() {
//                        authViewModel.registerUser(
//                            role: "user",
//                            fullName: fullName,
//                            documentType: documentType,
//                            documentNumber: documentNumber,
//                            password: password
//                        )
                    } else {
                        showError = true
                    }
                }) {
                    Text("Registrar")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
//                
//                NavigationLink(
//                    destination: LoginUserView(),
//                    isActive: $authViewModel.
//                ) {
//                    EmptyView()
//                }
                
                if showError {
                    Text("Por favor, preencha todos os campos corretamente.")
                        .foregroundColor(.red)
                }
                
                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .padding()
            .navigationTitle("Registro")
        }
    }
    
    private func validateFields() -> Bool {
        return !fullName.isEmpty &&
        !documentType.isEmpty &&
        !documentNumber.isEmpty &&
        !password.isEmpty
    }
}
