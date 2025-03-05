import SwiftUI

struct NewDependentView: View {
    @State private var name = ""
    @State private var apelido = ""

    var body: some View {
        VStack(spacing: 0) {
            TextFieldComponent(title: "Nome Completo", placeholder: "Nome", textContentType: .name, text: $name)
            
            TextFieldComponent(title: "Apelido", placeholder: "Apelido", textContentType: .name, text: $apelido)
            
            
        }
    }
}

struct NewDependentView_Previews: PreviewProvider {
    static var previews: some View {
        NewDependentView()
    }
}
