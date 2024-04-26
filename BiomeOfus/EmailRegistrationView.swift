//
//  EmailRegistrationView.swift
//  BiomeOfus
//
//  Created by Jaresi Nunez on 4/25/24.
//

import SwiftUI

struct EmailRegistrationView: View {
    var email: String
    @Binding var isPresented: Bool
    let continueAction: () -> Void

    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
            
            Text("Congratulations!")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Your email has been successfully registered.")
                .font(.body)
                .multilineTextAlignment(.center)
            
            Text(email)
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            
            Button(action: {
                print("Continue Button Pressed")
                continueAction()
               
            }) {
                Text("Continue")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
}
