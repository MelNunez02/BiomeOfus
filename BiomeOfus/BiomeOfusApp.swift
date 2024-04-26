import SwiftUI
import Firebase

@main
struct MyApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginScn()
           // DashboardView() // Set your main view here
           // BiomeView()
        }
    }
}
