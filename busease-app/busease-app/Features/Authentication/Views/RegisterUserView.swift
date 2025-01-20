import SwiftUI
    
struct RegisterUserView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var showingErrorAlert = false
    @State private var fullName = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        ImageView(name: "logo", color: ColorBE.colorButton, width: 170, height: 45)
                        textTitle
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 120)
                
                TextFieldComponent(
                    title: "Nome Completo",
                    placeholder: "Digite seu nome completo",
                    textContentType: .username,
                    text: $fullName
                )
                
                TextFieldComponent(
                    title: "E-mail",
                    placeholder: "Digite seu e-mail",
                    textContentType: .emailAddress,
                    text: $viewModel.email
                )
                
                TextFieldComponent(
                    title: "Senha",
                    placeholder: "Digite sua senha",
                    textContentType: .password,
                    text: $viewModel.password
                )
                .padding(.bottom, 10)
                
                buttonContinue
                componentOr
                buttonLoginGoogle
                
                buttonSignIn
                Spacer()
            }
            .padding()
            .background(ColorBE.colorBg.ignoresSafeArea())
            .onChange(of: viewModel.isLoggedIn) { isLoggedIn in
                if isLoggedIn {
                    
                }
            }
            .alert(isPresented: $showingErrorAlert) {
                Alert(
                    title: Text("Erro Register"),
                    message: Text(viewModel.errorMessage ?? "Erro desconhecido."),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
    }
}

extension RegisterUserView {
    private var textTitle: some View {
        Text("Register to use!")
            .font(Font.customFont(family: .encode, type: .light, size: .medium))
            .multilineTextAlignment(.center)
            .foregroundColor(ColorBE.colorTextTitle)
    }
    
    private var componentOr: some View {
        HStack(spacing: 15) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(ColorBE.colorBgAssistantSecondary)
            
            Text("or")
                .foregroundColor(ColorBE.colorTextPrimary)
                .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(ColorBE.colorBgAssistantSecondary)
        }
    }
}

extension RegisterUserView {
    private var buttonContinue: some View {
        Button(action: {
            viewModel.login()
            if let errorMessage = viewModel.errorMessage {
                viewModel.errorMessage = errorMessage
                showingErrorAlert = true
            }
        }) {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else {
                Text("Continue")
                    .font(Font.customFont(family: .encode, type: .regular, size: .medium))
                    .foregroundColor(ColorBE.colorTextBtnSecondary)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(ColorBE.colorButton)
                    .cornerRadius(8)
            }
        }
        .disabled(viewModel.isLoading)
    }
    
    private var buttonLoginGoogle: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: "")
                Text("Register with Google")
                    .font(Font.customFont(family: .encode, type: .regular, size: .medium))
                    .foregroundColor(ColorBE.colorButton)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(ColorBE.colorBGComponent)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(ColorBE.colorButton, lineWidth: 1)
            }
            .cornerRadius(8)
        }
    }
    
    private var buttonSignIn: some View {
        HStack {
            Spacer()
            HStack {
                Text("Already have an account?")
                    .foregroundColor(ColorBE.colorTextPrimary)
                    .font(Font.customFont(family: .encode, type: .regular, size: .small))
                
                Button {
                    
                } label: {
                    Text("Sign In")
                        .foregroundColor(ColorBE.colorButtonAssistant)
                        .font(Font.customFont(family: .encode, type: .regular, size: .small))
                }
            }
            Spacer()
        }
    }
}
