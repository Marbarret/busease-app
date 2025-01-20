import SwiftUI

struct IconView: View {
    let name: String
    let color: Color
    let size: CGFloat

    var body: some View {
        Image(name)
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .foregroundColor(color)
            .frame(width: size, height: size)
    }
}
