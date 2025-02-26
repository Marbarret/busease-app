import SwiftUI

struct NotificationButton: View {
    @State var valueNotification: Int = 0
    @Binding var showNotifications: Bool

    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    showNotifications.toggle()
                }
            }) {
                ZStack {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.blue)
                        .frame(width: 20, height: 20)
                    
                    if valueNotification > 0 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(x: 9, y: -9)
                    }
                }
            }
            .padding()
        }
    }
}

struct Notification: Identifiable {
    let id = UUID()
    let user: String
    let message: String
    let timeAgo: String
    let profileImage: String
}

let notifications: [Notification] = [
    Notification(user: "@mizajhones2020", message: "Corretíssimo", timeAgo: "há 1 dia", profileImage: "person.circle"),
    Notification(user: "@camila_dev", message: "Nova atualização disponível", timeAgo: "há 3h", profileImage: "bell.fill"),
    Notification(user: "@john_doe", message: "Seu pedido foi confirmado", timeAgo: "há 5 min", profileImage: "checkmark.circle")
]
