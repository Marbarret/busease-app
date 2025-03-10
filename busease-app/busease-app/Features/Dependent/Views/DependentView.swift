import SwiftUI

struct DependentView: View {
    @Environment(\.dismiss) var dismiss
    var dependent: Dependent
    
    var body: some View {
        NavigationStack {
            VStack {
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
                VStack {
                    ZStack {
                        Image(dependent.user.photo ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 110)
                            .clipShape(Circle())
                        
                        Button(action: { }) {
                            IconView(name: "ic_edit", color: ColorBE.colorTabBarFill, size: 20)
                                .frame(width: 35, height: 35)
                                .background(ColorBE.colorBgSurface)
                                .clipShape(Circle())
                        }
                        .offset(x: 30, y: 45)

                    }
                    
                    Text(dependent.user.genericName ?? "")
                        .font(Font.customFont(family: .encode, type: .semiBold, size: .big))
                        .foregroundColor(ColorBE.colorTextTitle)
                    
                    Text(dependent.school)
                        .font(Font.customFont(family: .encode, type: .semiBold, size: .tiny))
                        .foregroundColor(ColorBE.colorTextSecondary)
                    
                    Text(dependent.transPlan.planType)
                        .font(Font.customFont(family: .encode, type: .thin, size: .tiny))
                        .foregroundColor(ColorBE.colorTextSecondary)
                    
                    headerActivities
                    formulario
                }
                Spacer()
            }
            .padding()
            .background(ColorBE.colorBg.ignoresSafeArea())
            .navigationBarBackButtonHidden(true)
        }
    }
}

extension DependentView {
    private var headerActivities: some View {
        HStack {
            ComponentDataDependent(value: "02/2024", description: "Desde")
            ComponentDataDependent(value: "120", description: "Viagens")
            ComponentDataDependent(value: "8", description: "Faltas")
        }
    }
    
    private var formulario: some View {
        VStack {
            TextfieldExample(hint: "Name", name: "Sharon Mina", icon: "ic_profile")
        }
    }
}
