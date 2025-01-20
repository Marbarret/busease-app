import SwiftUI

protocol ColorBEProtocol {
    static var colorBg: Color { get }
    static var colorBgSurface: Color { get }
    static var colorBgAssistantPrimary: Color { get }
    static var colorBgAssistantSecondary: Color { get }
    static var colorTextPrimary: Color { get }
    static var colorTextSecondary: Color { get }
    static var colorTextTitle: Color { get }
    static var colorTextCaption: Color { get }
    static var colorTextBtnPrimary: Color { get }
    static var colorTextBtnSecondary: Color { get }
    static var colorIconTabBarSelected: Color { get }
    static var colorIconTabBarUnselected: Color { get }
    static var colorButton: Color { get }
    static var colorButtonSecondary: Color { get }
    static var colorButtonGhost: Color { get }
    static var colorButtonAssistant: Color { get }
    static var colorTextfield: Color { get }
}

class ColorBE: ColorBEProtocol {
    static var colorTextfield = Color(hexLightMode: "#D4D4D4", hexDarkMode: "#373737")
    static var colorTextfieldComponent = Color(hexLightMode: "#DDDDDD", hexDarkMode: "#222222")
    static var colorBGComponent = Color(hexLightMode: "#FAFAFA", hexDarkMode: "#OAOAOA")
    
    static var colorBg = Color(hexLightMode: "#F5F6F8", hexDarkMode: "#1A1A1A")
    static var colorBgSurface = Color(hexLightMode: "#FFFFFF", hexDarkMode: "#0D0D0D")
    static var colorBgAssistantPrimary = Color(hexLightMode: "#F5F5F5", hexDarkMode: "#1E1E1E")
    static var colorBgAssistantSecondary = Color(hexLightMode: "#E3E5E5", hexDarkMode: "#2C2C2C")
    
    static var colorTextPrimary = Color(hexLightMode: "#333333", hexDarkMode: "#CCCCCC")
    static var colorTextSecondary = Color(hexLightMode: "#5C5C5C", hexDarkMode: "#AAAAAA")
    static var colorTextTitle = Color(hexLightMode: "#0077C2", hexDarkMode: "#66BFFF")
    static var colorTextCaption = Color(hexLightMode: "#E3E5E5", hexDarkMode: "#2C2C2C")
    static var colorTextBtnPrimary = Color(hexLightMode: "#00619A", hexDarkMode: "#7C54A7")
    static var colorTextBtnSecondary = Color(hexLightMode: "#FFFFFF", hexDarkMode: "#0D0D0D")
    
    static var colorIconTabBarSelected = Color(hexLightMode: "#FFFFFF", hexDarkMode: "#0D0D0D")
    static var colorIconTabBarUnselected = Color(hexLightMode: "#E3E5E5", hexDarkMode: "#2C2C2C")
    
    static var colorButton = Color(hexLightMode: "#00619A", hexDarkMode: "#4EA3D9")
    static var colorButtonSecondary = Color(hexLightMode: "#FFF", hexDarkMode: "#0D0D0D")
    static var colorButtonGhost = Color(hexLightMode: "#E3E5E5", hexDarkMode: "#2C2C2C")
    static var colorButtonAssistant = Color(hexLightMode: "#00BFFF", hexDarkMode: "#009AD6")
}
