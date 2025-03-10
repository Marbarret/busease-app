import SwiftUI

struct NewDependentView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var apelido = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    Button(action: { dismiss() }) {
                        IconView(name: "ic_left_chevron", color: ColorBE.colorTabBarFill, size: 20)
                            .frame(width: 35, height: 35)
                            .background(ColorBE.colorBgSurface)
                            .clipShape(Circle())
                    }
                    Spacer()
                    Button(action: { }) {
                        IconView(name: "ic_settings", color: ColorBE.colorTabBarFill, size: 20)
                            .frame(width: 35, height: 35)
                            .background(ColorBE.colorBgSurface)
                            .clipShape(Circle())
                    }
                }
                
                Spacer()
                
                TextFieldComponent(title: "Nome Completo", placeholder: "Nome", textContentType: .name, text: $name)
                
                TextFieldComponent(title: "Apelido", placeholder: "Apelido", textContentType: .name, text: $apelido)
                
                Spacer()
            }
            .padding()
            .background(ColorBE.colorBg.ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct NewDependentView_Previews: PreviewProvider {
    static var previews: some View {
        NewDependentView()
    }
}
