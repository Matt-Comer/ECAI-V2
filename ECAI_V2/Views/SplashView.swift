//
//  SplashView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-10.
//
import SwiftUI
// Displays the opening splash screen for Elite Contractor AI.
struct SplashView: View {
    // Stores whether the Authentication-controlled application should be displayed.
    @State private var showApplication = false
    // Builds the complete splash transition.
    var body: some View {
        // Switches between the splash artwork and Firebase Authentication gate.
        ZStack {
            // Checks whether the splash screen has finished.
            if showApplication {
                // Opens Authentication or the signed-in ECAI application.
                AuthenticationGateView()
            } else {
                // Places the splash artwork and overlay in layers.
                ZStack {
                    // Displays the official ECAI splash artwork.
                    Image("ECAI_Splash_V1")
                        // Allows the image to resize.
                        .resizable()
                        // Fills the entire screen while keeping its proportions.
                        .scaledToFill()
                        // Allows the image to fill the available screen.
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity
                        )
                        // Removes image content outside the screen.
                        .clipped()
                        // Extends the artwork behind the safe areas.
                        .ignoresSafeArea()
                    // Adds the established dark splash overlay.
                    Color.black
                        .opacity(0.12)
                        .ignoresSafeArea()
                }
                // Runs when the splash screen first appears.
                .onAppear {
                    // Waits before opening the Authentication-controlled application.
                    DispatchQueue.main.asyncAfter(
                        deadline: .now() + 2.2
                    ) {
                        // Animates the transition into Authentication or ECAI.
                        withAnimation(
                            .easeInOut(
                                duration: 0.55
                            )
                        ) {
                            // Displays the Authentication-controlled application.
                            showApplication = true
                        }
                    }
                }
            }
        }
    }
}
// Displays the splash screen inside the Xcode preview.
#Preview {
    // Creates the splash screen with the Firebase Authentication service it requires.
    SplashView()
        .environmentObject(AuthService())
}
