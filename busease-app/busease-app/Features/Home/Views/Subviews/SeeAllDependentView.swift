import SwiftUI

struct SeeAllDependentView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
            }
        }
        .navigationTitle("Dependentes")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:Button(action: { self.dismiss() }) {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(ColorBE.colorButtonAssistant)
            }
        })
        .background(ColorBE.colorBg)
    
    }
}

struct SeeAllDependentView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllDependentView()
    }
}
