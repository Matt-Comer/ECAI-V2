//
//  MoreView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-06-29.
//
//
import SwiftUI
// Displays the More screen for additional Elite Contractor AI features.
struct MoreView: View {
// Stores the metallic orange border gradient.
    private let borderGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.62, blue: 0.12),
            .orange,
            Color(red: 0.72, green: 0.28, blue: 0.02)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Stores the metallic orange title gradient.
    private let titleGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.70, blue: 0.18),
            .orange,
            Color(red: 1.00, green: 0.38, blue: 0.02)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    // Displays the More screen interface.
    var body: some View {
        NavigationStack {
            ZStack {
                // Displays the black application background.
                Color.black
                    .ignoresSafeArea()

                // Allows the More screen to scroll.
                ScrollView {
                    VStack(alignment: .leading, spacing: 22) {
                        // Displays the same header used by the other main pages.
                        brandHeader

                        // Displays the More screen hero.
                        ECAIHeroView(
                            imageName: "moreview_splashscreen-V1",
                            title: "BUISNESS TOOLS",
                            subtitle: "Revenue, AI, company information, and settings."
                        )
                    // Opens the Revenue screen.
                        NavigationLink {
                            RevenueView()
                        } label: {
                            MoreCard(
                                icon: "dollarsign.circle.fill",
                                title: "Revenue",
                                subtitle: "Track income and projected earnings"
                            )
                        }
                        // Opens the AI Assistant screen.
                        NavigationLink {
                            AIAssistantView()
                        } label: {
                            MoreCard(
                                icon: "sparkles",
                                title: "AI Assistant",
                                subtitle: "Generate quotes and business ideas"
                            )
                        }
                        // Opens the Business Profile screen.
                        NavigationLink {
                            BusinessProfileView()
                        } label: {
                            MoreCard(
                                icon: "building.2.fill",
                                title: "Business Profile",
                                subtitle: "Manage company information"
                            )
                        }
                    // Opens the Settings screen.
                        NavigationLink {
                            SettingsView()
                        } label: {
                            MoreCard(
                                icon: "gearshape.fill",
                                title: "Settings",
                                subtitle: "Customize your ECAI experience"
                            )
                        }
                    }
                    .padding()
                    .padding(.bottom, 120)
                }
                .scrollIndicators(.hidden)
            }
        }
    }

// Creates the same E.C.A.I. header used by the other main screens.
    private var brandHeader: some View {
        ZStack(alignment: .topLeading) {
             // Creates the dark header background.
            RoundedRectangle(cornerRadius: 22)
                .fill(
                    Color(
                        red: 0.055,
                        green: 0.045,
                        blue: 0.045
                    )
                )

            // Adds the metallic orange border.
            RoundedRectangle(cornerRadius: 22)
                .stroke(
                    borderGradient,
                    lineWidth: 2
                )
            // Displays the E.C.A.I. logo on the left.
            Image("ECAI-Logo-#1")
                .resizable()
                .scaledToFit()
                .frame(width: 78, height: 78)
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )
                .padding(.leading, 16)
                .padding(.top, 14)

            // Displays the social icons on the right.
            HStack(spacing: 5) {
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 31, height: 31)

                Image("LinkedInIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 31, height: 31)

                Image("x")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
            }
            .frame(
                maxWidth: .infinity,
                alignment: .topTrailing
            )
            .padding(.top, 22)
            .padding(.trailing, 18)

            // Displays the same centered title layout as the other pages.
            VStack(spacing: 5) {
                Text("E.C.A.I.")
                    .font(
                        .system(
                            size: 34,
                            weight: .black
                        )
                    )
                    .foregroundStyle(titleGradient)
                    .shadow(
                        color: .orange.opacity(0.55),
                        radius: 8
                    )

                // Displays the Business Tools initials.
                Text("B.T.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .tracking(1.4)
                    .foregroundStyle(
                        Color(
                            red: 0.95,
                            green: 0.67,
                            blue: 0.20
                        )
                    )
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal, 115)
        }
        // Matches the other main-page header height.
        .frame(height: 135)
        .shadow(
            color: .black.opacity(0.55),
            radius: 12,
            x: 0,
            y: 6
        )
        .shadow(
            color: .orange.opacity(0.30),
            radius: 12
        )
    }
}

#Preview {
    MoreView()
}
