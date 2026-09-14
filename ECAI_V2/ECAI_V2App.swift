//
//  ECAI_V2App.swift
//  ECAI_V2
//
//  Created by Matthew Comer.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck

// Connects the SwiftUI lifecycle to Firebase.
final class AppDelegate: NSObject, UIApplicationDelegate {

    // Runs when iOS finishes launching ECAI.
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [
            UIApplication.LaunchOptionsKey: Any
        ]? = nil
    ) -> Bool {

        // Uses Firebase App Check while testing in the simulator.
        #if DEBUG
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        #endif

        // Connects ECAI to the configured Firebase project.
        FirebaseApp.configure()

        // Confirms that the application finished launching.
        return true
    }
}

// Creates the main entry point for Elite Contractor AI.
@main
struct ECAI_V2App: App {

    // Registers the application delegate.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    // Builds the application's main scene.
    var body: some Scene {
        WindowGroup {
            // Displays the ECAI splash screen.
            SplashView()
        }
    }
}
