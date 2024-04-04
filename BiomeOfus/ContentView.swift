import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Pick Your Biome!")
                    .padding()
                
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
            .background(Image("Background") // Set your background image here
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all))
            .navigationTitle("BiomeOfUs!")
            
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
