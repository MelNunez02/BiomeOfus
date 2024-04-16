import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("bioMeWord")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Pick Your Biome!")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 244/255, green: 252/255, blue: 3/255))
                    .font(.system(size: 35))
                    .font(.largeTitle .uppercaseSmallCaps())
                    .shadow(color: .black, radius: 13, x: 3, y: 3)
                    
                
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
            
            
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
