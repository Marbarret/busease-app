import SwiftUI
import Combine

struct LoginUserView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var showingErrorAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        textTitle
                        ImageView(name: "logo", color: ColorBE.colorButton, width: 170, height: 45)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 120)
                
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
                buttonForgotPassword
                buttonContinue
                componentOr
                buttonLoginGoogle
                
                buttonSignUp
                Spacer()
                buttonTouchAuthentication
            }
            .padding()
            .background(ColorBE.colorBg.ignoresSafeArea())
            .onChange(of: viewModel.isLoggedIn) { isLoggedIn in
                if isLoggedIn {
                    
                }
            }
            .alert(isPresented: $showingErrorAlert) {
                Alert(
                    title: Text("Erro de Login"),
                    message: Text(viewModel.errorMessage ?? "Erro desconhecido."),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
    }
}

extension LoginUserView {
    private var textTitle: some View {
        Text("Welcome to")
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

extension LoginUserView {
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
                Text("Login with Google")
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
    
    private var buttonTouchAuthentication: some View {
        HStack {
            Spacer()
            VStack {
                Button {
                    
                } label: {
                    ImageView(name: "touch", color: ColorBE.colorButton, width: 47, height: 47)
                }
                Text("Login using your\nfingerprint")
                    .foregroundColor(ColorBE.colorButtonAssistant.opacity(0.5))
                    .font(Font.customFont(family: .encode, type: .light, size: .tiny))
                    .multilineTextAlignment(.center)
                
            }
            Spacer()
        }
    }
    
    private var buttonSignUp: some View {
        HStack {
            Spacer()
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(ColorBE.colorTextPrimary)
                    .font(Font.customFont(family: .encode, type: .regular, size: .small))
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .foregroundColor(ColorBE.colorButtonAssistant)
                        .font(Font.customFont(family: .encode, type: .regular, size: .small))
                }
            }
            Spacer()
        }
    }
    
    private var buttonForgotPassword: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Text("Forgot Password?")
                    .foregroundColor(ColorBE.colorButtonAssistant)
                    .font(Font.customFont(family: .encode, type: .regular, size: .small))
            }
        }
    }
}
