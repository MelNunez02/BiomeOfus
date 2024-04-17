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
//Profile screen code
struct ProfileViewScn: View {
    @Binding var showContentView: Bool
    
    var body: some View {
        ZStack { // Add ZStack for layering content
            //Color.blue // Example background
            NavigationView {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .zIndex(1)
                    .modifier(MyCustomModifier())
                
            }
            VStack {
                Text("User Name: ")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 244/255, green: 252/255, blue: 3/255))
                    .font(.system(size: 25))
                    .font(.largeTitle .uppercaseSmallCaps())
                    .shadow(color: .black, radius: 13, x: 3, y: 3)
                    .offset(x: 0, y: -70)
                    .zIndex(3)
                
                Image("profileHolder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 177)
                    .offset(x: 0, y: -300)
                    .zIndex(3)
                    .shadow(radius: 10)
            
                
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Profile")
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

//Big image on dashboard screen
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
                        .edgesIgnoringSafeArea(.top)
                }
            }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

struct MyCustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        AnyView(content.edgesIgnoringSafeArea(.all))
    }
}


