import SwiftUI

struct VerificationSuccessView: View {
    @State private var backToLoginview = false
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            IconView(name: "ic_success", color: ColorBE.colorSuccess, size: 60)
            Text("Conta verificada!")
                .foregroundColor(ColorBE.colorTextPrimary)
                .padding(20)

            Spacer()
            
            BEButton(title: "Fazer login", type: .primary) {
                backToLoginview = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(ColorBE.colorBg.ignoresSafeArea())
        .customFullScreenCover(isPresented: $backToLoginview) {
            LoginUserView()
        }
    }
}
