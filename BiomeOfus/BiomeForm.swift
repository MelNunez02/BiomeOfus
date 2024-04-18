//
//  biomeForm.swift
//  BiomeOfus
//
//  Created by Sergio Nunez on 4/18/24.
//

import SwiftUI

struct BiomeForm: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .modifier(MyCustomModifier())
                .zIndex(0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Book Title")
                    .fontWeight(.black)
                    .foregroundColor(Color(red: 244/255, green: 252/255, blue: 3/255))
                    .font(.system(size: 35))
                    .font(.largeTitle .uppercaseSmallCaps())
                    .shadow(color: .black, radius: 13, x: 3, y: 3)
                    .padding(.top, -330)
                    .offset(x: -45)
                
                
               
            }
            
        }
        .ignoresSafeArea(.all)
        
    }
}

//struct BiomeForm: View {
//    @AppStorage("title") private var title: String = "Default Title" // Default title
//}

#Preview {
    BiomeForm()
}
