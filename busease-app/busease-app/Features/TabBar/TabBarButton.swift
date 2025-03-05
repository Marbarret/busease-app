import SwiftUI

struct TabBarButton: View {
    var title: String
    var image: String
    
    @Binding var selected: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                selected = title
            }
        }) {
            VStack(spacing: 3) {
                IconView(name: image,
                         color: selected == title ? ColorBE.colorIconTabBarSelected : ColorBE.colorIconTabBarUnselected,
                         size: 20)
                
                Text(title)
                    .font(Font.customFont(family: .encode, type: .thin, size: .tiny))
                    .foregroundColor(selected == title ? ColorBE.colorIconTabBarSelected : ColorBE.colorIconTabBarUnselected)
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal)
        .background(ColorBE.colorTabBarFill.opacity(selected == title ? 0.5 : 0))
        .clipShape(Capsule())
    }
}
