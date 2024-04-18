//
//  ProfileView.swift
//  BiomeOfus
//
//  Created by Jaresi Nunez on 4/17/24.
//

import SwiftUI

struct BiomeView: View {
    var body: some View {
        ZStack {
            Image("theAppleTree")
                .resizable()
                .scaledToFill()
                .modifier(MyCustomModifier())
                .zIndex(0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
           
                Button(action: {
                    print("Apple pressed")
                }) {
                    Image("clearApple")
                        .resizable()
                        .scaledToFit()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .shadow(color: .accentColor , radius: 10, x: 0, y: 0)
                        .zIndex(1)
               }
                .buttonStyle(.borderless)
            }
            .offset(x: 45, y: 125)
        }
        .ignoresSafeArea(.all)
        
    }
}

#Preview {
    BiomeView()
}






