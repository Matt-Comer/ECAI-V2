//
//  MoreView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
// Displays the More screen for additional Elite Contractor AI features.
struct MoreView: View {
    // Displays the More screen interface.
    var body: some View {
        // Creates the navigation system for the More screen.
        NavigationStack {
            // Places the background behind all screen content.
            ZStack {
                // Displays the application background.
                ECAITheme.graphite
                    .ignoresSafeArea()
                // Allows the More screen content to scroll vertically.
                ScrollView {
                    // Places every section of the screen vertically.
                    VStack(alignment: .leading, spacing: 22) {
                        // Displays the correct logo and page title.
                        ECAIBrandHeader(
                            title: "E.C.A.I.",
                            subtitle: "B.T."
                        )
                        // Displays the former Dashboard PNG.
                        ECAIHeroView(
                            imageName: "ECAI_CommandCenter_V1",
                            title: "Business Command Center",
                            subtitle: "Revenue, AI, company information, and settings."
                        )
                        // Opens the Revenue screen when the user taps the card.
                        NavigationLink {
                            // Navigates to the Revenue screen.
                            RevenueView()
                        } label: {
                            // Displays the Revenue navigation card.
                            MoreCard(
                                icon: "dollarsign.circle.fill",
                                title: "Revenue",
                                subtitle: "Track income and projected earnings"
                            )
                        }
                        // Opens the AI Assistant screen when the user taps the card.
                        NavigationLink {
                            // Navigates to the AI Assistant screen.
                            AIAssistantView()
                        } label: {
                            // Displays the AI Assistant navigation card.
                            MoreCard(
                                icon: "sparkles",
                                title: "AI Assistant",
                                subtitle: "Generate quotes and business ideas"
                            )
                        }
                        // Opens the Business Profile screen when the user taps the card.
                        NavigationLink {
                            // Navigates to the Business Profile screen.
                            BusinessProfileView()
                        } label: {
                            // Displays the Business Profile navigation card.
                            MoreCard(
                                icon: "building.2.fill",
                                title: "Business Profile",
                                subtitle: "Manage company information"
                            )
                        }
                        // Opens the Settings screen when the user taps the card.
                        NavigationLink {
                            // Navigates to the Settings screen.
                            SettingsView()
                        } label: {
                            // Displays the Settings navigation card.
                            MoreCard(
                                icon: "gearshape.fill",
                                title: "Settings",
                                subtitle: "Customize your ECAI experience"
                            )
                        }
                    }
                    // Adds spacing around the screen content.
                    .padding()
                    // Keeps the final navigation card above the tab bar.
                    .padding(.bottom, 120)
                }
                // Hides the default scroll indicator.
                .scrollIndicators(.hidden)
            }
        }
    }
}
// Displays the More screen inside the Xcode preview.
#Preview {
    // Creates a preview of the More screen.
    MoreView()
}
