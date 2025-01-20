import SwiftUI

// Enum para tipos de botões
enum BEButtonType {
    case primary
    case secondary
    case text
    case icon
    case onlyText
}

struct BEButton: View {
    let title: String
    let type: BEButtonType
    let action: () -> Void
    var icon: String? = nil
    
    var body: some View {
        Button(action: action) {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(foregroundColor)
                }
                if !title.isEmpty {
                    Text(title)
                        .font(Font.customFont(family: .encode, type: .regular, size: .medium))
                        .foregroundColor(foregroundColor)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: type == .secondary ? 1 : 0)
            )
        }
    }
    
    private var backgroundColor: Color {
        switch type {
        case .primary:
            return ColorBE.colorButton
        case .secondary:
            return ColorBE.colorBGComponent
        case .text:
            return .clear
        case .icon:
            return .clear
        case .onlyText:
            return .clear
        }
    }
    
    private var foregroundColor: Color {
        switch type {
        case .primary:
            return ColorBE.colorTextBtnPrimary
        case .secondary:
            return ColorBE.colorButton
        case .text:
            return ColorBE.colorButton
        case .icon:
            return ColorBE.colorButton
        case .onlyText:
            return ColorBE.colorButton
        }
    }
    
    private var borderColor: Color {
        switch type {
        case .secondary:
            return ColorBE.colorButton
        default:
            return .clear
        }
    }
}
