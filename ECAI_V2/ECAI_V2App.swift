//
//  ECAI_V2App.swift
//  ECAI_V2
//
//  Created by Matthew Comer.
//
import SwiftUI
// Imports FirebaseCore so the app can connect to the configured Firebase project.
import FirebaseCore
// Connects the SwiftUI application lifecycle to Firebase's required application delegate setup.
final class AppDelegate: NSObject, UIApplicationDelegate {
    // Runs when iOS finishes launching ECAI.
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        // Reads GoogleService-Info.plist and initializes the shared Firebase application.
        FirebaseApp.configure()
        // Confirms that ECAI completed its application launch setup.
        return true
    }
}
// Creates the main entry point for Elite Contractor AI.
@main
struct ECAI_V2App: App {
    // Registers the application delegate so Firebase initializes before ECAI uses any Firebase service.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // Builds the application's main scene.
    var body: some Scene {
        // Creates the main application window.
        WindowGroup {
            // Displays the ECAI splash screen when the app launches.
            SplashView()
        }
    }
}
