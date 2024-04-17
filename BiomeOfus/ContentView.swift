import SwiftUI

struct DashboardView: View {
    @State private var showProfile = false
    
    var body: some View {
        NavigationStack {
            VStack {

                Text("Pick Your Biome!")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 244/255, green: 252/255, blue: 3/255))
                    .font(.system(size: 35))
                    .font(.largeTitle .uppercaseSmallCaps())
                    .shadow(color: .black, radius: 13, x: 3, y: 3)
                    .padding(.top, 170)
                    
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                        ForEach(1..<13) { index in
                            Image("image\(index)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(12)
                                .padding(5)
                        }
                    }
                    .padding(12)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .modifier(ImageTitleModifier(imageName: "bioMeWord"))
            .background(Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all))
            .gesture( // Added .gesture()
                            DragGesture(minimumDistance: 20, coordinateSpace: .local)
                                .onEnded { value in
                                    if value.translation.width > 0 {
                                        showProfile = true
                                    }
                                }
                        )
            .navigationDestination(isPresented: $showProfile) {
                ProfileViewScn(showContentView: $showProfile)
            }

        }
    }
}

struct ProfileViewScn: View {
    @Binding var showContentView: Bool

    var body: some View {
        ZStack { // Add ZStack for layering content
            Color.gray // Example background
            Text("Profile View")
                .gesture(
                    DragGesture(minimumDistance: 20, coordinateSpace: .local)
                        .onEnded { value in
                            if value.translation.width < 0 {
                                showContentView = false
                            }
                        }
                )
         }
    }
}


struct ImageTitleModifier: ViewModifier {
    let imageName: String
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 333)
                        .padding(.top, 150)
                }
            }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
