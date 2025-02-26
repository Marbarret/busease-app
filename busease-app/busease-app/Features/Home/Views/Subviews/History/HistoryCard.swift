import SwiftUI

struct HistoryCard: View {
    let startTime: String
    let endTime: String
    let origin: String
    let destination: String
    
    var body: some View {
        VStack {
            HStack(spacing: 5) { // Inicio
                VStack(spacing: 12) {
                    VStack(spacing: 2) {
                        Text("Inicio")
                            .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
                            .foregroundColor(ColorBE.colorTextSecondary)
                        Text(startTime)
                            .foregroundColor(ColorBE.colorTextPrimary)
                            .font(Font.customFont(family: .encode, type: .semiBold, size: .small))
                    }
                    VStack(spacing: 2) {
                        Text("Origem")
                            .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
                            .foregroundColor(ColorBE.colorTextSecondary)
                        
                        Text(origin)
                            .foregroundColor(ColorBE.colorTextPrimary)
                            .font(Font.customFont(family: .encode, type: .semiBold, size: .small))
                    }
                }
                .foregroundColor(.gray)
                
                HStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                    
                    VStack(spacing: 2) {
                        Text("0:30")
                            .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
                            .foregroundColor(ColorBE.colorTextSecondary)
                    }
                    .frame(minWidth: 0, maxWidth: 35, minHeight: 0, maxHeight: 10)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(ColorBE.colorButton.opacity(0.5),
                                    style: StrokeStyle(lineWidth: 1))
                    )
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                        .opacity(0.5)
                }
                
                VStack(spacing: 12) {
                    VStack(spacing: 2) {
                        Text("Fim")
                            .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
                            .foregroundColor(ColorBE.colorTextSecondary)
                        
                        Text(endTime)
                            .foregroundColor(ColorBE.colorTextPrimary)
                            .font(Font.customFont(family: .encode, type: .semiBold, size: .small))
                        
                    }
                    VStack(spacing: 2) {
                        Text("Destino")
                            .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
                            .foregroundColor(ColorBE.colorTextSecondary)
                        
                        Text(destination)
                            .foregroundColor(ColorBE.colorTextPrimary)
                            .font(Font.customFont(family: .encode, type: .semiBold, size: .small))
                        
                    }
                }
            }
        }
        .padding()
        .background(ColorBE.colorBgSurface)
        .cornerRadius(8)
        .shadow(radius: 0.5)
    }
}
