//
//  LoginScn.swift
//  BiomeOfus
//
//  Created by Melanie Nunez on 4/17/24.
//

import SwiftUI
import Firebase


struct LoginScn: View {
    @State private var isDetailViewPresented = false
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedin: Bool = false
    @State private var showDashboard = false // For presenting the Dashboard
    @State private var showAlert: Bool = false
    @State private var isUsernameValid: Bool = false
    @State private var isEmailRegistrationViewPresented: Bool = false
    @State private var LoginScnPresented: Bool = false
    @State private var userIsLogedIn: Bool = false
       

    var body: some View {
        if userIsLogedIn {
            DashboardView()
        } else {
            content
        }
    }
        
        var content: some View {
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
                                .autocapitalization(.none)
                                .padding()
                                .frame(width: 300)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                            if (email.count != 0) {
                                Image(systemName: email.isValidEmail() ? "checkmark" : "xmark" )
                                    .fontWeight(.bold)
                                    .foregroundColor(email.isValidEmail() ? .green : .red)
                            }
                        }
                        
                        HStack{
                            Image(systemName: "lock")
                            SecureField("Password", text: $password)
                                .padding()
                                .frame(width: 300)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                           
                            if (password.count != 0) {
                                Image(systemName: password.isValidPassword() ? "checkmark" : "xmark" )
                                    .fontWeight(.bold)
                                    .foregroundColor(password.isValidPassword() ? .green : .red)
                            }
                        }
                        .padding(.horizontal)
            
                        Button(action: {
                            print("Sign Up pressed")
                            // Validate username and password
                            register()
                            self.isEmailRegistrationViewPresented = true
                        }) {
                            Text("Sign Up")
                                .padding()
                                .foregroundColor(.black)
                                .background(Color.yellow)
                                .cornerRadius(10)
                        }
                        .padding()
                        .padding(.bottom, -10)
                        .sheet(isPresented: $isEmailRegistrationViewPresented) {
                            EmailRegistrationView(email: email, isPresented: $isEmailRegistrationViewPresented) {
                                self.isEmailRegistrationViewPresented = false
                                self.email = ""
                                self.password = ""
                            }
                            .presentationDetents([.large])
                            .edgesIgnoringSafeArea(.all)
                        }
                        
                        Button(action: {
                            if isValid(email: email, password: password) {
                                isLoggedin = true
                                login()
                              //  isDetailViewPresented = true
                                
                            } else {
                                showAlert = true
                            }
                           
                        }, label: {
                            Text("Already have an account? Login")
                                .foregroundColor(.white)
                        })
                        .padding()
                        .zIndex(1)
                    }
                }
                .padding(.horizontal)
            }
        
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Invalid username or password"), dismissButton: .default(Text("OK")))
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let user = result?.user {
               print("User signed in: \(user)")
               // Update the state variable to indicate the user is logged in
               self.userIsLogedIn = true
           } else if let error = error {
               // Handle the error, perhaps set another @State variable to show an alert
               print(error.localizedDescription)
               self.showAlert = true
           }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
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
