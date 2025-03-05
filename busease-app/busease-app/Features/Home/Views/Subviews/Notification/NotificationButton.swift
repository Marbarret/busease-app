import SwiftUI

struct NotificationButton: View {
    @State var valueNotification: Int = 2
    @Binding var showNotifications: Bool

    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    showNotifications.toggle()
                }
            }) {
                ZStack {
                    IconView(name: "ic_bell", color: ColorBE.colorTabBarFill, size: 20)
                        .frame(width: 35, height: 35)
                        .background(ColorBE.colorBgSurface)
                        .clipShape(Circle())
                    
                    if valueNotification > 0 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(x: 7, y: -7)
                    }
                }
            }
            .padding()
        }
    }
}
