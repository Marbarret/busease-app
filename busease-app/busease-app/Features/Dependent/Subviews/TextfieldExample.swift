import SwiftUI

struct TextfieldExample: View {
    var hint: String
    var name: String
    var icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(hint)
                .font(Font.customFont(family: .encode, type: .regular, size: .medium))
                .foregroundColor(ColorBE.colorTextfield)
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(ColorBE.colorTextfield, lineWidth: 1)
                    .frame(height: 52)
                
                HStack {
                    IconView(name: icon, color: ColorBE.colorTextfield, size: 20)
                    Text(name)
                }
            }
            .background(ColorBE.colorBGComponent)
            .cornerRadius(8)
        }
    }
}
