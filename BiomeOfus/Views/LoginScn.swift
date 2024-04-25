//
//  LoginScn.swift
//  BiomeOfus
//
//  Created by Melanie Nunez on 4/17/24.
//

import SwiftUI


struct LoginScn: View {
    @State private var isDetailViewPresented = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedin: Bool = false
    @State private var showDashboard = false // For presenting the Dashboard
    @State private var showAlert: Bool = false
    @State private var isUsernameValid: Bool = false
       

    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .zIndex(0)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack {
                    Spacer()
                    Image("Login")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 12)
                    Spacer()
                }
                .padding()
                
                if isLoggedin {
                    ContentView(showDashboard: $showDashboard)
                    
                } else {
         
                HStack{
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                        .frame(width: 400)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                   
                    
                    if (email.count != 0){
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark" )
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                }
                HStack{
                    Image(systemName: "lock")
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 400)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                   
                     
                    Image(systemName: "checkmark" )
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                       
                        
                Button(action: {
                    print("button pressed")
                    // Validate username and password
                    if isValid(email: email, password: password) {
                        isLoggedin = true
                        isDetailViewPresented = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Log In")
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .padding()
                .padding(.bottom, -10)
                Button(action: {}
                       , label: {
                    Text("Create an Account")
                        .foregroundColor(.white)
                        
                })
                    .padding()
                    .zIndex(1)
                }
            }
            
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Invalid username or password"), dismissButton: .default(Text("OK")))
        }
    }
}//end of screeen

struct ContentView: View {
    @Binding var showDashboard: Bool

    var body: some View {
        // ... Your ContentView layout ...

        Button("Show Dashboard") {
            showDashboard = true
        }
        .foregroundColor(.white)
        .sheet(isPresented: $showDashboard) {
            DashboardView()  // Directly instantiate DashboardView
        }
    }
}

func isValid(email: String, password: String) -> Bool {
   // Add your validation logic here (e.g., check against database)
   return !email.isEmpty && !password.isEmpty
}

struct LoginScn_Previews: PreviewProvider {
   static var previews: some View {
       LoginScn()
   }
}


#Preview {
    LoginScn()
}
