//
//  ProfileView.swift
//  BiomeOfus
//
//  Created by Jaresi Nunez on 4/17/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            HStack {
                    Image(systemName: "chevron.backward") // Example back button
                    Spacer()
                    Text("Profile")
                        .font(.headline)
                    Spacer()
                }
            
            NavigationView {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .modifier(MyCustomModifier())
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle("Profile")
        
        
    }
}

#Preview {
    ProfileView()
}






