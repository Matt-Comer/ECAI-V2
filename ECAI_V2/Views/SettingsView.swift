
//
//  SettingsView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-17.
//
import SwiftUI
// Imports FirebaseAuth so Settings can display the signed-in Firebase user's email address.
import FirebaseAuth
// Displays the Settings screen for customizing the E.C.A.I. application.
struct SettingsView: View {
    // Receives the shared Firebase Authentication service from ECAI_V2App.
    @EnvironmentObject private var authService: AuthService
    // Stores whether application notifications are enabled.
    @State private var notificationsEnabled = true
    // Stores whether quote reminders are enabled.
    @State private var quoteRemindersEnabled = true
    // Stores whether job reminders are enabled.
    @State private var jobRemindersEnabled = true
    // Stores whether sound effects are enabled.
    @State private var soundEnabled = false
    // Builds the complete Settings screen.
    var body: some View {
        // Places the background behind all screen content.
        ZStack {
            // Displays the E.C.A.I. graphite background.
            ECAITheme.graphite
                .ignoresSafeArea()
            // Allows the Settings content to scroll vertically.
            ScrollView {
                // Places every Settings section vertically.
                VStack(spacing: 16) {
                    // Displays the reusable E.C.A.I. hero banner.
                    ECAIHeroView(
                        imageName: "ECAI-splashscreen-V6",
                        title: "Settings",
                        subtitle: "Customize your E.C.A.I. experience."
                    )
                    // Displays the signed-in Firebase account and logout control.
                    accountSettingsCard
                    // Displays the notification settings card.
                    notificationSettingsCard
                    // Displays the application settings card.
                    applicationSettingsCard
                    // Displays the application information card.
                    applicationInformationCard
                }
                // Adds spacing around the screen content.
                .padding()
                // Adds space below the final card.
                .padding(.bottom, 30)
            }
            // Hides the default scroll indicator.
            .scrollIndicators(.hidden)
        }
    }
    // Creates the Firebase account settings card.
    private var accountSettingsCard: some View {
        // Places the Firebase account information and logout control vertically.
        VStack(alignment: .leading, spacing: 16) {
            // Displays the account card heading.
            settingsSectionHeader(
                icon: "person.crop.circle.badge.checkmark",
                title: "Firebase Account"
            )
            // Displays the email address of the signed-in Firebase user.
            settingsInformationRow(
                icon: "envelope.fill",
                title: "Signed In",
                value: authService.currentUser?.email ?? "Firebase User"
            )
            // Signs the current user out of Firebase Authentication.
            Button {
                // Ends the Firebase session and returns ECAI to the Login screen.
                authService.signOut()
            } label: {
                // Displays the logout button label.
                Label(
                    "Logout",
                    systemImage: "rectangle.portrait.and.arrow.right"
                )
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
            }
            // Uses the plain button style so the ECAI design remains in control.
            .buttonStyle(.plain)
            // Displays the logout label in black over the orange button.
            .foregroundStyle(.black)
            // Displays the ECAI orange logout button background.
            .background(Color.orange)
            // Rounds the logout button corners.
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the account card.
        .padding(18)
        // Applies the reusable Settings card appearance.
        .settingsCard()
    }
    // Creates the notification settings card.
    private var notificationSettingsCard: some View {
        // Places the notification settings vertically.
        VStack(alignment: .leading, spacing: 16) {
            // Displays the card heading.
            settingsSectionHeader(
                icon: "bell.fill",
                title: "Notifications"
            )
            // Allows application notifications to be enabled or disabled.
            Toggle(
                "Enable Notifications",
                isOn: $notificationsEnabled
            )
            // Allows quote reminders to be enabled or disabled.
            Toggle(
                "Quote Reminders",
                isOn: $quoteRemindersEnabled
            )
            // Allows job reminders to be enabled or disabled.
            Toggle(
                "Job Reminders",
                isOn: $jobRemindersEnabled
            )
        }
        // Applies the orange tint to the toggles.
        .tint(.orange)
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the card.
        .padding(18)
        // Applies the reusable Settings card appearance.
        .settingsCard()
    }
    // Creates the application settings card.
    private var applicationSettingsCard: some View {
        // Places the application settings vertically.
        VStack(alignment: .leading, spacing: 16) {
            // Displays the card heading.
            settingsSectionHeader(
                icon: "gearshape.fill",
                title: "Application"
            )
            // Allows sound effects to be enabled or disabled.
            Toggle(
                "Sound Effects",
                isOn: $soundEnabled
            )
            // Displays the current application theme.
            settingsInformationRow(
                icon: "paintpalette.fill",
                title: "Theme",
                value: "E.C.A.I. Dark"
            )
            // Displays the current accent colour.
            settingsInformationRow(
                icon: "circle.fill",
                title: "Accent Colour",
                value: "Orange"
            )
        }
        // Applies the orange tint to the toggle.
        .tint(.orange)
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the card.
        .padding(18)
        // Applies the reusable Settings card appearance.
        .settingsCard()
    }
    // Creates the application information card.
    private var applicationInformationCard: some View {
        // Places the application information vertically.
        VStack(alignment: .leading, spacing: 16) {
            // Displays the card heading.
            settingsSectionHeader(
                icon: "info.circle.fill",
                title: "Application Information"
            )
            // Displays the application name.
            settingsInformationRow(
                icon: "app.fill",
                title: "Application",
                value: "Elite Contractor AI"
            )
            // Displays the current application version.
            settingsInformationRow(
                icon: "number.circle.fill",
                title: "Version",
                value: "1.0"
            )
            // Displays the application developer.
            settingsInformationRow(
                icon: "person.fill",
                title: "Developer",
                value: "Matthew Comer"
            )
        }
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
        // Adds spacing inside the card.
        .padding(18)
        // Applies the reusable Settings card appearance.
        .settingsCard()
    }
    // Creates one reusable Settings section heading.
    private func settingsSectionHeader(icon: String, title: String) -> some View {
        // Places the heading icon and title horizontally.
        HStack(spacing: 10) {
            // Displays the heading icon.
            Image(systemName: icon)
                .foregroundStyle(ECAITheme.orangeMetal)
            // Displays the heading title.
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            // Pushes the heading toward the left.
            Spacer()
        }
    }
    // Creates one reusable Settings information row.
    private func settingsInformationRow(icon: String, title: String, value: String) -> some View {
        // Places the row information horizontally.
        HStack(spacing: 12) {
            // Displays the row icon.
            Image(systemName: icon)
                .foregroundStyle(ECAITheme.orangeMetal)
                .frame(width: 24)
            // Displays the row title.
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.70))
            // Pushes the value toward the right.
            Spacer()
            // Displays the row value.
            Text(value)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.trailing)
        }
    }
}
// Creates the reusable Settings card appearance.
private extension View {
    // Applies the dark card background, orange border, and glow.
    func settingsCard() -> some View {
        // Applies every card style to the selected view.
        self
            // Creates the dark metallic background.
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 0.11, green: 0.09, blue: 0.08),
                        Color(red: 0.06, green: 0.055, blue: 0.055)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            // Rounds the card corners.
            .clipShape(RoundedRectangle(cornerRadius: 18))
            // Adds the metallic orange border.
            .overlay(
                RoundedRectangle(cornerRadius: 18)
                    .stroke(
                        ECAITheme.orangeMetal.opacity(0.80),
                        lineWidth: 1.4
                    )
            )
            // Adds the orange glow behind the card.
            .shadow(
                color: Color.orange.opacity(0.18),
                radius: 8
            )
    }
}
// Displays the Settings screen inside Xcode previews.
#Preview {
    // Creates a preview of the Settings screen.
    SettingsView()
        // Supplies the Firebase Authentication service required by the Settings preview.
        .environmentObject(AuthService())
}
