import SwiftUI

struct DependentCard: View {
    let name: String
    let status: String
    let image: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(ColorBE.colorBgSurface)
                .frame(width: 120, height: 120)
                .shadow(radius: 0.5)
            
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -30)
                
                Text(name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.top, -20)
                
                Text(status)
                    .font(.caption)
                    .foregroundColor(.green)
            }
        }
    }
}
