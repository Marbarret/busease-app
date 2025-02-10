import SwiftUI

struct VerificationSuccessView: View {
    @State private var backToLoginview = false
    
    var body: some View {
        VStack {
            Text("Verificação realizada!")
            
            
            BEButton(title: "Fazer login", type: .primary) {
                backToLoginview = true
            }
        }
        .customFullScreenCover(isPresented: $backToLoginview) {
            LoginUserView()
        }
    }
}
