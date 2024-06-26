//
//  ProfileView.swift
//  BiomeOfus
//
//  Created by Jaresi Nunez on 4/17/24.
//

import SwiftUI

struct BiomeView: View {
    @AppStorage("title") private var title: String = "BiomeOfUs" // Default title
    @State private var showBiomeForm = false

    var body: some View {
        ZStack {
            Image("Forest")
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
                        print("Apple pressed")
                        showBiomeForm = true
                        
                    }) {
                        Image("clearApple")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .shadow(color: .accentColor , radius: 10, x: 0, y: 0)
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
                            print("Apple pressed")
                            showBiomeForm = true
                            
                        }) {
                            Image("clearApple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .shadow(color: .accentColor , radius: 10, x: 0, y: 0)
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
                            print("Apple pressed")
                            showBiomeForm = true
                            
                        }) {
                            Image("clearApple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .shadow(color: .accentColor , radius: 10, x: 0, y: 0)
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
                    HStack{
                        Button(action: {
                            print("Apple pressed")
                            showBiomeForm = true
                            
                        }) {
                            Image("clearApple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .shadow(color: .accentColor , radius: 10, x: 0, y: 0)
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
                            print("Apple pressed")
                            showBiomeForm = true
                            
                        }) {
                            Image("clearApple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .shadow(color: .accentColor , radius: 10, x: 0, y: 0)
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
                            print("Apple pressed")
                            showBiomeForm = true
                            
                        }) {
                            Image("clearApple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .shadow(color: .accentColor , radius: 10, x: 0, y: 0)
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
    BiomeView()
}






