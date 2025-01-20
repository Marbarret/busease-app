import SwiftUI

extension Font {
    static func customFont(family: FontFamily, type: FontType, size: FontSize) -> Font {
        let fontName = "\(family.rawValue)-\(type.rawValue)"
        return Font.custom(fontName, size: size.rawValue)
    }
}
