import SwiftUI

struct ComponentView: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Text(title)
                .font(.callout)
                .foregroundColor(ColorBE.colorTextPrimary)
            
            Spacer()
            
            Button(action: action) {
                Text("See all")
                    .font(.caption)
                    .foregroundColor(ColorBE.colorButtonAssistant)
            }
        }
        .padding(.vertical, 10)
    }
}
