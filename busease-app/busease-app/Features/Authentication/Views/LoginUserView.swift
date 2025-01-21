import SwiftUI

struct LoginUserView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var showingErrorAlert = false
    @State var isRegisterPresented = false
    @State var isForgotPassPresented = false
    @State var isGoogleBTNPresented = false
    
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
            .customFullScreenCover(isPresented: $isRegisterPresented) {
                RegisterUserView()
            }
            .customFullScreenCover(isPresented: $isForgotPassPresented) {
//                ForgotPasswordView()
            }
            .customFullScreenCover(isPresented: $isGoogleBTNPresented) {
//                Auth with Google
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
        BEButton(title: "Continue", type: .primary) {
            viewModel.login()
            if let errorMessage = viewModel.errorMessage {
                viewModel.errorMessage = errorMessage
                showingErrorAlert = true
            }
        }
        .disabled(viewModel.isLoading)
    }
    
    private var buttonLoginGoogle: some View {
        BEButton(title: "Login with Google", type: .primary, action:  {
            print("Login com google")
        }, icon: "")
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
                    withAnimation(.linear(duration: 0.5)) {
                        isRegisterPresented.toggle()
                    }
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
                isForgotPassPresented = true
            } label: {
                Text("forgot password?")
                    .foregroundColor(ColorBE.colorButtonAssistant)
                    .font(Font.customFont(family: .encode, type: .regular, size: .small))
            }

        }
    }
}
