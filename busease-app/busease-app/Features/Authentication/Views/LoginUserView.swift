import SwiftUI

struct LoginUserView: View {
    @StateObject private var authViewModel = AuthenticationViewModel()
    @State private var document = ""
    @State private var password = ""
    @State private var navigateToHome = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .foregroundColor(ColorBE.colorTextTitle)
                    
                    Text("Back")
                        .font(.largeTitle)
                        .foregroundColor(ColorBE.colorTextTitle)
                }
//                .padding(.horizontal, 20)
                .padding(.vertical, 50)
                
                
                TextFieldComponent(title: "E-mail",
                                   placeholder: "Digite seu e-mail",
                                   textContentType: .emailAddress, titleFont: .callout,
                                   placeHolderFont: .caption,
                                   //                                   validateFieldCallBack: { text in return navigateToHome },
                                   text: $document)
                
                
                TextFieldComponent(title: "Senha",
                                   placeholder: "Digite sua senha",
                                   textContentType: .password, titleFont: .callout,
                                   placeHolderFont: .caption,
                                   //                                       validateFieldCallBack: { text in return navigateToHome },
                                   text: $password)
                
                Button(action: {
                    authViewModel.login(document: document, password: password)
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .background(ColorBE.colorButton)
                        .cornerRadius(8)
                }
                .padding()
                Spacer()
                NavigationLink(destination: RegisterUserView()) {
                    Text("Cadastrar Usuário")
                        .foregroundColor(ColorBE.colorButtonAssistant)
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
            .padding()
            .background {
                ColorBE.colorBg.ignoresSafeArea()
            }
        }
    }
}
