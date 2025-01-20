import SwiftUI
import Combine

import SwiftUI

struct LoginUserView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @State private var showingErrorAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack {
                    textTitle
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 180)
                
                TextFieldComponent(
                    title: "E-mail",
                    placeholder: "Digite seu e-mail",
                    textContentType: .emailAddress,
                    titleFont: .callout,
                    placeHolderFont: .caption,
                    text: $viewModel.email
                )
                
                TextFieldComponent(
                    title: "Senha",
                    placeholder: "Digite sua senha",
                    textContentType: .password,
                    titleFont: .callout,
                    placeHolderFont: .caption,
                    text: $viewModel.password
                )
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Forgot Password?")
                            .foregroundColor(ColorBE.colorButtonAssistant)
                            .font(.footnote)
                    }
                }
                
                buttonContinue
                
                componentOr
                
                buttonLoginGoogle
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Don't have an account? Sign Up")
                            .foregroundColor(ColorBE.colorButtonAssistant)
                            .font(.footnote)
                    }
                    Spacer()
                }
            }
            .padding()
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
        Text("Welcome to\nBusEase")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .foregroundColor(ColorBE.colorTextTitle)
    }
    
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
                    .bold()
                    .foregroundColor(.white)
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
                    .fontWeight(.medium)
                    .foregroundColor(ColorBE.colorButton)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(ColorBE.colorButton, lineWidth: 1)
            }
        }
    }
    
    private var componentOr: some View {
        HStack {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(ColorBE.colorTextPrimary.opacity(0.5))
            
            Text("or")
                .foregroundColor(ColorBE.colorTextPrimary)
                .font(.footnote)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(ColorBE.colorTextPrimary.opacity(0.5))
        }
        
    }
}
