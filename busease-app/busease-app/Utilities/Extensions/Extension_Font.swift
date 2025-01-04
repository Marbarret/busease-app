import SwiftUI

extension Font {
    static func encodeMedium(size: Font.FontSize) -> Font {
        return Font.custom("EncodeSans-Medium", size: size.rawValue)
    }
    static func encodeLight(size: Font.FontSize) -> Font {
        return Font.custom( "EncodeSans-Light", size: size.rawValue)
    }
    static func encodeRegular(size: Font.FontSize) -> Font {
        return Font.custom( "EncodeSans-Regular", size: size.rawValue)
    }
    static func encodeSemiBold(size: Font.FontSize) -> Font {
        return Font.custom( "EncodeSans-SemiBold", size: size.rawValue)
    }
    static func encodeBold(size: Font.FontSize) -> Font {
        return Font.custom( "EncodeSans-Bold", size: size.rawValue)
    }
    
    enum FontSize: CGFloat {
        case tiny = 12.0
        case small = 14.0
        case medium = 16.0
        case great = 18.0
        case large = 20.0
        case big = 22.0
        case biggest = 24.0
    }
}
