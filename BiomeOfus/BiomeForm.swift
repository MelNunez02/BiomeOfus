//
//  biomeForm.swift
//  BiomeOfus
//
//  Created by Sergio Nunez on 4/18/24.
//

import SwiftUI

struct BiomeForm: View {
    @AppStorage("BTitle") private var title: String = "Book Title" // Default title
    @State private var paragraphText: String = ""
    
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .modifier(MyCustomModifier())
                .zIndex(0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
//                Text("Book Title")
//                    .fontWeight(.black)
//                    .foregroundColor(Color(red: 244/255, green: 252/255, blue: 3/255))
//                    .font(.system(size: 35))
//                    .font(.largeTitle .uppercaseSmallCaps())
//                    .shadow(color: .black, radius: 13, x: 3, y: 3)
//                    .padding(.top, -200)
//                    .offset(x: -45)
                //Book Title
                RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.4)) // Adjust the color and opacity here
                        .frame(width: 200, height: 50)
                        
                        .shadow(color: .black, radius: 10, x: 0, y: 0)
                        .overlay(
                            TextField("  Book Title",text:$title) // Display the title inside the rectangle
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 200)
                                .shadow(color: .accentColor, radius: 10, x: 0, y: 0)
                                .padding()
                        )
                
                //Author
                RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.4)) // Adjust the color and opacity here
                        .frame(width: 200, height: 50)
                        .shadow(color: .black, radius: 10, x: 0, y: 0)
                        .overlay(
                            TextField("  Author",text: $title) // Display the title inside the rectangle
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 200)
                                .shadow(color: .accentColor, radius: 10, x: 0, y: 0)
                                .padding()
                        )
                
                //Description
                RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green.opacity(0.4)) // Adjust the color and opacity here
                        .frame(width: 200, height: 200)
                        .shadow(color: .black, radius: 10, x: 0, y: 0)
                        .overlay(
                            
                            
                            TextEditor(text: $paragraphText) // Display the title inside the rectangle
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                                .frame(width: 200, height: 200)
                                .onAppear{
                                    UITextView.appearance().backgroundColor = .clear
                                }
                                .shadow(color: .accentColor, radius: 10, x: 0, y: 0)
                                .padding()
                        )
            }
            .offset(x: -50, y: 25)
            
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
