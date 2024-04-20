//
//  ForestBiome.swift
//  BiomeOfus
//
//  Created by Melanie Nunez on 4/17/24.
//

import SwiftUI

struct ForestBiome: View {
    var body: some View {
        ZStack {
            //background image
            Image("ForestBiome2")
                .resizable()
                .scaledToFill()
                .zIndex(0)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("clearApple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .offset(x:50, y:-50)
            }
        }
    }
}

#Preview {
    ForestBiome()
}
