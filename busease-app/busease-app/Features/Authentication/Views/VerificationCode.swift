import SwiftUI

struct VerificationCode: View {
    @State private var code = ""
    @State private var showingErrorAlert = false
    @State private var timeRemaining = 200
    @State private var isTimerRunning = true
    @State private var isContinueDisabled = true
    @State private var backToRegister = true

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
                
                HStack {
                    Spacer()
                    if timeRemaining > 0 {
                        Text(timerText)
                            .font(Font.customFont(family: .encode, type: .light, size: .small))
                            .foregroundColor(.gray)
                    }
                }.frame(height: 20)
                
                buttonContinue
                
                buttonResendCode
                    .disabled(isContinueDisabled)
                
                Spacer()
            }
            .padding()
            .background(ColorBE.colorBg.ignoresSafeArea())
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        backToRegister.toggle()
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
                    title: Text("Verification Error"),
                    message: Text("Verification code is incorrect."),
                    dismissButton: .default(Text("Ok"))
                )
            }
            .onAppear {
                startTimer()
            }
            .customFullScreenCover(isPresented: $backToRegister) {
                RegisterUserView()
            }
        }
    }
}

extension VerificationCode {
    private var buttonContinue: some View {
        BEButton(title: "Continue", type: .primary) {
            print("Continue button tapped")
        }
    }
    
    private var buttonResendCode: some View {
        BEButton(title: "Resend", type: .onlyText) {
            resetTimer()
        }
    }

    private var textTitle: some View {
        Text("Verification code")
            .font(Font.customFont(family: .encode, type: .regular, size: .big))
            .multilineTextAlignment(.center)
            .foregroundColor(ColorBE.colorTextTitle)
    }
    
    private var timerText: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d remaining", minutes, seconds)
    }
}

extension VerificationCode {
    private func startTimer() {
        isTimerRunning = true
        isContinueDisabled = true
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                isTimerRunning = false
                isContinueDisabled = false
                timer.invalidate()
            }
        }
    }
    
    private func resetTimer() {
        timeRemaining = 200
        startTimer()
    }
}
