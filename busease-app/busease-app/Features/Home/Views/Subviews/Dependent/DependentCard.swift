import SwiftUI

struct DependentCard: View {
    let name: String
    let status: String
    let image: String
    let school: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(ColorBE.colorBgSurface)
                .frame(width: 130, height: 140)
                .shadow(radius: 0.5)
            
            VStack(spacing: 0) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -30)
                
                Text(name)
                    .font(Font.customFont(family: .encode, type: .semiBold, size: .medium))
                    .padding(.top, -10)
                
                Text(school)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .font(Font.customFont(family: .encode, type: .light, size: .small))
                    .padding(.top, 5)
                
                Text(status)
                    .font(Font.customFont(family: .encode, type: .light, size: .small))
                    .foregroundColor(.green)
            }
        }
    }
}
