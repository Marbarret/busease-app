import SwiftUI

struct ComponentDataDependent: View {
    var value: String
    var description: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(value)
                .font(Font.customFont(family: .encode, type: .semiBold, size: .medium))
                .foregroundColor(ColorBE.colorTextTitle)
            
            Text(description)
                .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
                .foregroundColor(ColorBE.colorTextSecondary)
        }
        .frame(width: 110, height: 70)
        .background(ColorBE.colorBgSurface)
        .cornerRadius(10)
    }
}
