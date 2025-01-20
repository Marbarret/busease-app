import SwiftUI
import Combine

protocol TextFieldComponentProtocol {
    var title: String { get }
    var placeholder: String { get }
    var textContentType: UITextContentType { get }
    func setKeyboardType() -> UIKeyboardType
}

struct TextFieldComponent: TextFieldComponentProtocol, View {
    var title: String
    var placeholder: String
    var textContentType: UITextContentType
    
    @Binding var text: String
    @State private var isVisiblePassword: Bool = false
    @FocusState private var isFocused: Bool
    
    private let textSubject = PassthroughSubject<String, Never>()
    @State private var cancellables = Set<AnyCancellable>()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(Font.customFont(family: .encode, type: .regular, size: .medium))
                .foregroundColor(ColorBE.colorTextfield)
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(ColorBE.colorTextfield, lineWidth: 1)
                    .frame(height: 52)
                
                HStack {
                    if textContentType == .password {
                        if !isVisiblePassword {
                            setupPasswordUnvisible
                        } else {
                            setupPasswordVisible
                        }
                        
                        Button {
                            isVisiblePassword.toggle()
                        } label: {
                            IconView(name: isVisiblePassword ? "ic_openEye" : "ic_closeEye", color: ColorBE.colorTextfield, size: 20)
                        }
                        .padding(.horizontal, 20)
                    } else {
                        patternField
                    }
                }
            }
            .background(ColorBE.colorBGComponent)
            .cornerRadius(8)
        }
    }
}

extension TextFieldComponent {
    func setKeyboardType() -> UIKeyboardType {
        switch textContentType {
        case .emailAddress: return .emailAddress
        case .telephoneNumber: return .phonePad
        default:
            return .default
        }
    }
    
    private var setupPasswordUnvisible: some View {
        SecureField(placeholder, text: $text)
            .focused($isFocused)
            .onChange(of: text, perform: { value in
                textSubject.send(value)
            })
            .font(Font.customFont(family: .encode, type: .light, size: .tiny))
            .padding(.horizontal, 10)
            .disableAutocorrection(true)
            .textContentType(.password)
            .keyboardType(setKeyboardType())
            .autocapitalization(.none)
    }
    
    private var setupPasswordVisible: some View {
        TextField(placeholder, text: $text)
            .focused($isFocused)
            .onChange(of: text, perform: { value in
                textSubject.send(value)
            })
            .font(Font.customFont(family: .encode, type: .light, size: .tiny))
            .padding(.horizontal, 10)
            .disableAutocorrection(true)
            .textContentType(.password)
            .keyboardType(setKeyboardType())
            .autocapitalization(.none)
    }
    
    private var patternField: some View {
        TextField(placeholder, text: $text)
            .focused($isFocused)
            .onChange(of: text, perform: { value in
                textSubject.send(value)
            })
            .font(Font.customFont(family: .encode, type: .light, size: .tiny))
            .padding(.horizontal, 10)
            .disableAutocorrection(true)
            .textContentType(textContentType)
            .keyboardType(setKeyboardType())
            .autocapitalization(.none)
    }
}
