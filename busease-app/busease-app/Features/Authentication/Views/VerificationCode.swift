import SwiftUI

struct VerificationCode: View {
    @State private var code = ""
    @State private var showingErrorAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                textTitle
                    .padding(.top, 40)
                
                Text("Enter the 4 digits we sent to the\nregistered email.")
                    .font(Font.customFont(family: .encode, type: .light, size: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorBE.colorTextSecondary)
                
                TextFieldComponent(
                    title: "",
                    placeholder: "verification code",
                    textContentType: .oneTimeCode,
                    text: $code
                )
                .padding(.bottom, 10)
                buttonContinue
                buttonResendCode
                Spacer()
            }
            .padding()
            .background(ColorBE.colorBg.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        ImageView(name: "ic_left_chevron", color: ColorBE.colorTextTitle, width: 20, height: 20)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Change email")
                            .font(Font.customFont(family: .encode, type: .light, size: .small))
                            .foregroundColor(ColorBE.colorButton)
                    }
                }
            }
            .alert(isPresented: $showingErrorAlert) {
                Alert(
                    title: Text("Erro Verificação"),
                    message: Text("Código de verificação está incorreto."),
                    dismissButton: .default(Text("Ok"))
                )
            }
        }
    }
}

extension VerificationCode {
    private var buttonContinue: some View {
        Button {
            showingErrorAlert = true
        } label: {
            Text("Continue")
                .font(Font.customFont(family: .encode, type: .regular, size: .medium))
                .foregroundColor(ColorBE.colorTextBtnSecondary)
                .frame(maxWidth: .infinity)
                .padding()
                .background(ColorBE.colorButton)
                .cornerRadius(8)
        }
    }
    
    private var buttonResendCode: some View {
        Button {
            
        } label: {
            Text("Resend")
                .font(Font.customFont(family: .encode, type: .regular, size: .medium))
                .foregroundColor(ColorBE.colorButton)
                .frame(maxWidth: .infinity)
                .padding()
        }
    }

    private var textTitle: some View {
        Text("Verification code")
            .font(Font.customFont(family: .encode, type: .regular, size: .big))
            .multilineTextAlignment(.center)
            .foregroundColor(ColorBE.colorTextTitle)
    }
}
