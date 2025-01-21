import SwiftUI

struct ImageView: View {
    let name: String
    let color: Color
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(name)
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .foregroundColor(color)
            .frame(width: width, height: height)
    }
}
