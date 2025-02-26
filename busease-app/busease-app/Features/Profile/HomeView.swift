import SwiftUI

struct HomeView: View {
    let email: String
    let token: String
    
    var body: some View {
        VStack {
            Text("Bem-vindo, \(email)")
            Text("Seu token é \(token)")
        }
    }
}
