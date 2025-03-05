import SwiftUI

struct HistoryCard: View {
    let startTime: String
    let endTime: String
    let origin: String
    let destination: String
    
    var body: some View {
        HStack(spacing: 5) {
            VStack(spacing: 0) {
                IconView(name: "ic_location",
                         color: ColorBE.colorTextSecondary.opacity(0.5),
                         size: 15)
                .frame(width: 30, height: 30)
                .background(ColorBE.colorBg)
                .clipShape(Circle())

                
                Rectangle()
                    .frame(width: 1)
                    .foregroundColor(ColorBE.colorTextSecondary)
                    .opacity(0.5)
                
                
                IconView(name: "ic_location",
                         color: ColorBE.colorTextSecondary.opacity(0.5),
                         size: 15)
                .frame(width: 30, height: 30)
                .background(ColorBE.colorBg)
                .clipShape(Circle())
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(origin)
                            .foregroundColor(ColorBE.colorTextPrimary)
                            .font(Font.customFont(family: .encode, type: .semiBold, size: .medium))
                        Text("Origem")
                            .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
                            .foregroundColor(ColorBE.colorTextSecondary)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 2) {
                        Text(startTime)
                            .foregroundColor(ColorBE.colorTextPrimary)
                            .font(Font.customFont(family: .encode, type: .light, size: .small))
                    }
                    .frame(minWidth: 0, maxWidth: 40, minHeight: 0, maxHeight: 15)
                    .padding(10)
                    .background(ColorBE.colorBg.opacity(0.5))
                    .cornerRadius(8)
                }
                
                Spacer()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(destination)
                            .foregroundColor(ColorBE.colorTextPrimary)
                            .font(Font.customFont(family: .encode, type: .semiBold, size: .medium))
                        Text("Destination")
                            .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
                            .foregroundColor(ColorBE.colorTextSecondary)
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 2) {
                        Text(endTime)
                            .foregroundColor(ColorBE.colorTextPrimary)
                            .font(Font.customFont(family: .encode, type: .light, size: .small))
                    }
                    .frame(minWidth: 0, maxWidth: 40, minHeight: 0, maxHeight: 15)
                    .padding(10)
                    .background(ColorBE.colorBg.opacity(0.5))
                    .cornerRadius(8)
                }
            }
        }
        .padding(30)
        .background(ColorBE.colorBgSurface)
        .cornerRadius(8)
        .shadow(radius: 0.5)
    }
}

/*
 HStack(spacing: 0) {
     Rectangle()
         .frame(height: 1)
         .foregroundColor(ColorBE.colorBgAssistantSecondary)
         .opacity(0.5)
     
     VStack(spacing: 2) {
         Text("0:30")
             .font(Font.customFont(family: .encode, type: .regular, size: .tiny))
             .foregroundColor(ColorBE.colorBgAssistantSecondary)
     }
     .frame(minWidth: 0, maxWidth: 35, minHeight: 0, maxHeight: 10)
     .padding(10)
     .overlay(
        RoundedRectangle(cornerRadius: 8)
            .stroke(ColorBE.colorBgAssistantSecondary.opacity(0.5),
                    style: StrokeStyle(lineWidth: 1))
     )
     
     Rectangle()
         .frame(height: 1)
         .foregroundColor(ColorBE.colorBgAssistantSecondary)
         .opacity(0.5)
 }
*/
