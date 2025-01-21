import SwiftUI

extension View {
    func customFullScreenCover<Content: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.background(
            CustomFullScreenCover(isPresented: isPresented, content: content)
        )
    }
}
