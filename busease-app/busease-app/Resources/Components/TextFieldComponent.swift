import SwiftUI
import Combine

protocol TextFieldComponentProtocol {
    var title: String { get }
    //    var error: String { get }
    var placeholder: String { get }
    //    var errorValidation: Bool { get }
    var textContentType: UITextContentType { get }
    func setKeyboardType() -> UIKeyboardType
}

struct TextFieldComponent: TextFieldComponentProtocol, View {
    //    var error: String
    //    var errorValidation: Bool
    var title: String
    var placeholder: String
    var textContentType: UITextContentType
    var titleFont: Font = .encodeMedium(size: .small)
    var placeHolderFont: Font = .encodeMedium(size: .small)
    //    var validateFieldCallBack: (String) -> Bool
    
    //    @State var hasToShowErrorMessage: Bool = false
    @State private var isVisiblePassword: Bool = false
    @State private var isEditing: Bool = false
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            //            Text(title)
            //                .foregroundColor(Color.theme.colorTextCaption)
            //                .font(titleFont)
            //                .padding(.bottom, -3)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(ColorBE.colorTextfield, lineWidth: 1)
                    .frame(maxHeight: 52)
                HStack {
                    if textContentType == .password {
                        if !isVisiblePassword {
                            SecureField(placeholder, text: $text)
                                .focused($isFocused)
                                .font(placeHolderFont)
                                .foregroundColor(ColorBE.colorTextfield)
                                .frame(height: 52)
                                .disableAutocorrection(true)
                                .textContentType(.password)
                                .keyboardType(setKeyboardType())
                                .autocapitalization(.none)
                        }
                        else {
                            TextField(placeholder, text: $text)
                                .focused($isFocused)
                                .font(placeHolderFont)
                                .foregroundColor(ColorBE.colorTextfield)
                                .frame(height: 52)
                                .disableAutocorrection(true)
                                .textContentType(.password)
                                .keyboardType(setKeyboardType())
                                .autocapitalization(.none)
                        }
                        
                        Button {
                            isVisiblePassword.toggle()
                        } label: {
                            Image(isVisiblePassword ? "ic_openEye" : "ic_closeEye")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(ColorBE.colorTextfield)
                                .frame(width: 20, height: 20)
                        }
                        .padding(.horizontal, -3)
                    }
                    else {
                        TextField(placeholder, text: $text)
                            .focused($isFocused)
                            .onChange(of: isFocused, perform: { changed in
                                if !changed {
                                    //                                        hasToShowErrorMessage = !validateFieldCallBack(text)
                                }
                                isFocused = changed
                            })
                            .font(placeHolderFont)
                            .foregroundColor(ColorBE.colorTextfield)
                            .frame(height: 52)
                            .disableAutocorrection(true)
                            .textContentType(textContentType)
                            .keyboardType(setKeyboardType())
                            .autocapitalization(.none)
                    }
                }
                .padding(.horizontal, 15)
                
            }
            //            if hasToShowErrorMessage {
            //                Text(error)
            //                    .foregroundColor(.red)
            //                    .fixedSize(horizontal: false, vertical: true)
            //                    .font(.caption)
            //                    .frame(maxWidth: .infinity, alignment: .leading)
            //            }
        }
    }
}

struct TextFieldComponent_Preview: PreviewProvider {
    
    static var previews: some View {
        StatefulPreviewWrapper("") { text in
            
            TextFieldComponent(title: "Email", placeholder: "Digitar email", textContentType: .emailAddress, text: text)
        }
    }
}

struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    private let content: (Binding<Value>) -> Content
    
    init(_ initialValue: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: initialValue)
        self.content = content
    }
    
    var body: some View {
        content($value)
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
}

