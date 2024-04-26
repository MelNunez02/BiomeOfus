import SwiftUI

struct DashboardView: View {
    @State private var showProfile = false
    @State private var headerImage = true
    
    @State private var isBiomeViewPresented = false
    @State private var isMountainsViewPresented = false
    @State private var isBeachViewPresented = false
    @State private var isOceanViewPresented = false
    @State private var isJungleViewPresented = false
    @State private var isSnowViewPresented = false
    @State private var isDesertViewPresented = false
    @State private var isNetherViewPresented = false
    @State private var isSwampViewPresented = false
    @State private var isGrasslandsViewPresented = false
    @State private var isCherryBlossomViewPresented = false
    
    var body: some View {
        
        ZStack{
            if !showProfile {
                Image("bioMeWord")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 333)
                    .offset(x: 0, y: -300)
                    .zIndex(10)
                    .shadow(radius: 10)
            }
            
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
                                //Buttons code start here
                                Button(action: {
                                    if index == 1 {
                                        // Present BiomeView here
                                        self.isMountainsViewPresented = true
                                    } else if index == 2 {
                                        self.isBeachViewPresented = true
                                    } else if index == 3 {
                                        self.isCherryBlossomViewPresented = true
                                    } else if index == 4 {
                                        self.isGrasslandsViewPresented = true
                                    } else if index == 5 {
                                        self.isOceanViewPresented = true
                                    } else if index == 6 {
                                        self.isJungleViewPresented = true
                                    } else if index == 7 {
                                        self.isSnowViewPresented = true
                                    } else if index == 8 {
                                        self.isDesertViewPresented = true
                                    } else if index == 9 {
                                        self.isBeachViewPresented = true
                                    } else if index == 10 {
                                        self.isBiomeViewPresented = true
                                    } else if index == 11 {
                                        self.isNetherViewPresented = true
                                    } else if index == 12 {
                                        self.isSwampViewPresented = true
                                    }
                                    else {
                                        // Default behavior for other images
                                        print("Image \(index) tapped!")
                                    }
                    
                                }) {
                                    Image("image\(index)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(12)
                                        .padding(5)
                                }
                                .buttonStyle(.borderless)
                                .sheet(isPresented: $isBiomeViewPresented) {
                                    BiomeView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isMountainsViewPresented) {
                                    MountainsView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isBeachViewPresented) {
                                    BeachView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isOceanViewPresented) {
                                    OceanView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isJungleViewPresented) {
                                    JungleView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isSnowViewPresented) {
                                    SnowView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isDesertViewPresented) {
                                    DesertView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isSwampViewPresented) {
                                    SwampView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isGrasslandsViewPresented) {
                                    GrasslandsView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isCherryBlossomViewPresented) {
                                    CherryBlossomView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                                .sheet(isPresented: $isNetherViewPresented) {
                                    NetherView()
                                        .presentationDetents([.large])
                                        .edgesIgnoringSafeArea(.all)
                                }
                            }
                        }
                        .padding(12)
                    }
                }

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
    }// end body
    
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
        //LoginScn()
        DashboardView()
        //BiomeView()
    }
}

struct MyCustomModifier: ViewModifier {
    func body(content: Content) -> some View {
        AnyView(content.edgesIgnoringSafeArea(.all))
    }
}


