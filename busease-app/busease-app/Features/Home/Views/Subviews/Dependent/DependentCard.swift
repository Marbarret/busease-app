import SwiftUI

struct DependentCard: View {
//    let name: String
    let status: String
//    let image: String
//    let school: String
    let data: Dependent
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(ColorBE.colorBgSurface)
                .frame(width: 130, height: 140)
                .shadow(radius: 0.5)
            
            VStack(spacing: 0) {
                Image(data.user.photo ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -30)
                
                Text(data.user.genericName ?? "")
                    .font(Font.customFont(family: .encode, type: .semiBold, size: .medium))
                    .padding(.top, -5)
                
                VStack(spacing: 0) {
                    Text(data.school)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .font(Font.customFont(family: .encode, type: .light, size: .small))
                        .padding(.top, 5)
                }
                .frame(width: 100, height: 20)
                
                Text(status)
                    .font(Font.customFont(family: .encode, type: .light, size: .small))
                    .foregroundColor(.green)
            }
        }
    }
}
