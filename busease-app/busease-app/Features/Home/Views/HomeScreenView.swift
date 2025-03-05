import SwiftUI

struct HomeScreenView: View {
    @State private var isDependent: Bool = false
    @State private var isHistoryc: Bool = false
    @State private var showNotifications: Bool = false
    @State private var createNewDependent: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        headerComponent
                        bodyScroll
                        
                        VStack(spacing: 10) {
                            NavigationLink(destination: SeeAllDependentView(), isActive: $isDependent) { EmptyView() }
                            ComponentView(title: "Histórico", action: { self.isDependent = true })
                            
                            HistoryCard(startTime: "07:00", endTime: "07:30", origin: "Casa Pai", destination: "Escola Padre S.")
                            HistoryCard(startTime: "07:00", endTime: "07:30", origin: "Casa Pai", destination: "Escola Padre S.")
                        }
                    }
                    .padding()
                }
                .background(ColorBE.colorBg.ignoresSafeArea())
                .navigationBarHidden(true)

                
                if showNotifications {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showNotifications = false
                            }
                        }
                    
                    NotificationView(showNotifications: $showNotifications)
                        .transition(.opacity.combined(with: .scale.animation(.easeInOut)))
                        .zIndex(1)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
            }
            .navigationDestination(isPresented: $isDependent) {
                SeeAllDependentView()
            }
            .navigationDestination(isPresented: $createNewDependent) {
                NewDependentView()
            }
        }
    }
}

extension HomeScreenView {
    private var headerComponent: some View {
        HStack {
            Image("photo2")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(Utils().greeting())
                    .foregroundColor(.gray)
                
                Text("Jihyo")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(ColorBE.colorTextTitle)
            }
            Spacer()
            NotificationButton(showNotifications: $showNotifications)
        }
    }

    private var bodyScroll: some View {
        VStack {
            ComponentView(title: "Dependentes", action: { self.isDependent.toggle() })
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    Button(action: { createNewDependent.toggle() }) {
                        VStack {
                            Image(systemName: "plus")
                                .foregroundColor(ColorBE.colorButtonAssistant)
                        }
                        .frame(minWidth: 0, maxWidth: 7, minHeight: 0, maxHeight: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(ColorBE.colorButtonGhost.opacity(0.5),
                                        style: StrokeStyle(lineWidth: 2))
                        )
                    }
                    ForEach(dependent) { dep in
                        let destinationView = DependentView(dependent: dep)
                        NavigationLink(destination: destinationView) {
                            DependentCard(status: "Andamento", data: dep)
                        }
                    }
                }
                .padding(.top, 20)
            }
        }
        .padding(.vertical, 15)
    }
}
