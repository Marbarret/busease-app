import SwiftUI
    
struct RegisterUserView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var showingErrorAlert = false
    @State private var fullName = ""
    @State private var isLoginPresented = false
    @State private var isCodeValidationPresented = false
    @State private var isRegisterGooglePresented = false
    
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
            .customFullScreenCover(isPresented: $isLoginPresented) {
                LoginUserView()
            }
            .customFullScreenCover(isPresented: $isCodeValidationPresented) {
                VerificationCode()
            }
            .customFullScreenCover(isPresented: $isRegisterGooglePresented) {
//                Auth with Google
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
        BEButton(title: "Continue", type: .primary) {
//            viewModel.login()
            isCodeValidationPresented = true
//            if let errorMessage = viewModel.errorMessage {
//                viewModel.errorMessage = errorMessage
//                showingErrorAlert = true
//            }
        }
        .disabled(viewModel.isLoading)
    }
    
    private var buttonLoginGoogle: some View {
        BEButton(title: "Register with Google", type: .primary, action:  {
            isRegisterGooglePresented = true
        }, icon: "")
    }
    
    private var buttonSignIn: some View {
        HStack {
            Spacer()
            HStack {
                Text("Already have an account?")
                    .foregroundColor(ColorBE.colorTextPrimary)
                    .font(Font.customFont(family: .encode, type: .regular, size: .small))
                
                Button {
                    isLoginPresented = true
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
