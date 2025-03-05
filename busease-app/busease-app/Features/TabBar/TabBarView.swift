import SwiftUI

struct TabBarView: View {
    @State var currentTab = "Home"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $currentTab) {
                HomeScreenView()
                    .tag("Home")
                
                Text("Spent")
                    .tag("Spent")
                
                Text("Search")
                    .tag("Search")
                
                Text("Profile")
                    .tag("Profile")
                
                Text("More")
                    .tag("More")
            }
            
            HStack(spacing: 0) {
                TabBarButton(title: "Home", image: "ic_home", selected: $currentTab)
                Spacer(minLength: 0)
                
                TabBarButton(title: "Spent", image: "ic_credit_card", selected: $currentTab)
                Spacer(minLength: 0)
                
                TabBarButton(title: "Search", image: "ic_search", selected: $currentTab)
                TabBarButton(title: "Profile", image: "ic_profile", selected: $currentTab)
                TabBarButton(title: "More", image: "ic_more", selected: $currentTab)

            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(ColorBE.colorTabBarFill.edgesIgnoringSafeArea(.all))
            .clipShape(Capsule())
            .padding(.horizontal, 15)
        }
    }
}

