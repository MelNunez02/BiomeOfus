//
//  BeachView.swift
//  BiomeOfus
//
//  Created by Melanie Nunez on 4/25/24.
//

import SwiftUI

struct BeachView: View {
    @AppStorage("title") private var title: String = "BiomeOfUs" // Default title
    @State private var showBiomeForm = false

    var body: some View {
        ZStack {
            Image("beach2")
                .resizable()
                .scaledToFill()
                .modifier(MyCustomModifier())
                .zIndex(0)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                RoundedRectangle(cornerRadius: 8)
                        .fill(Color.green.opacity(0.4)) // Adjust the color and opacity here
                        .frame(width: 200, height: 50)
                        .offset(x: -150, y: -400)
                        .shadow(color: .black, radius: 10, x: 0, y: 0)
                        .overlay(
                            TextField("BiomeOfUs",text:$title) // Display the title inside the rectangle
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: 200)
                                .offset(x: -150, y: -400)
                                .shadow(color: .accentColor, radius: 10, x: 0, y: 0)
                                .padding()
                        )
                        .offset(x:0, y:50)
                
                VStack{
                    Button(action: {
                        print("shell pressed")
                        showBiomeForm = true
                        
                    }) {
                        Image("shell")
                            .resizable()
                            .scaledToFit()
                            .offset(x: -150, y: 200)
                            .frame(width: 90)
                            .shadow(color: .red, radius:10,  x: 0, y: 0)
                            .zIndex(1)
                   }
                    .buttonStyle(.borderless)
                    //Presents target View
                    .sheet(isPresented: $showBiomeForm) {
                        BiomeForm()
                            .presentationDetents([.large])
                            .edgesIgnoringSafeArea(.all)
                    }
                    
                    HStack{
                        Button(action: {
                            print("coconut pressed")
                            showBiomeForm = true
                            
                        }) {
                            Image("coconut")
                                .resizable()
                                .scaledToFit()
                                .offset(x: -150, y: 0)
                                .frame(width: 90)
                                .shadow(color: .blue , radius: 10, x: 0, y: 0)
                                .zIndex(1)
                       }
                        .buttonStyle(.borderless)
                        //Presents target View
                        .sheet(isPresented: $showBiomeForm) {
                            BiomeForm()
                                .presentationDetents([.large])
                                .edgesIgnoringSafeArea(.all)
                        }
                        
                        Button(action: {
                            print("Dolphin pressed")
                            showBiomeForm = true
                            
                        }) {
                            Image("dol")
                                .resizable()
                                .scaledToFit()
                                .offset(x: -150, y: -100)
                                .frame(width: 80)
                                .shadow(color: .accentColor, radius: 10, x: 0, y: 0)
                                .zIndex(1)
                       }
                        .buttonStyle(.borderless)
                        //Presents target View
                        .sheet(isPresented: $showBiomeForm) {
                            BiomeForm()
                                .presentationDetents([.large])
                                .edgesIgnoringSafeArea(.all)
                        }
                    }
                                        
                }.offset(x:-25, y:20)
                
            }
            .offset(x: 45, y: 125)
        }
        .ignoresSafeArea(.all)
        
    }
}

#Preview {
    BeachView()
}
