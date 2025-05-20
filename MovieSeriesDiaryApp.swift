import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct YourApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var vM = BindingPageViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if Auth.auth().currentUser != nil && vM.user == nil {
                    ProgressView()
                        .onAppear() {
                            vM.fetchUserData(email: Auth.auth().currentUser!.email!) { _ in
                                
                            }
                        }
                } else {
                    LoginPage()
                }
            }
        }
    }
}
