//
//  AuthenticationView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-08-10.
//
import SwiftUI
// Identifies whether the Authentication screen is signing in or creating an account.
private enum AuthenticationMode: String, CaseIterable, Identifiable {
    // Displays the existing-account login form.
    case login = "Login"
    // Displays the new-account registration form.
    case register = "Register"
    // Uses the mode's title as its stable SwiftUI identifier.
    var id: String {
        rawValue
    }
}
// Decides whether ECAI displays Authentication or the signed-in application.
struct AuthenticationGateView: View {
    // Creates and owns the Firebase Authentication service used by Login and ECAI.
    @StateObject private var authService = AuthService()
    // Builds the authentication-controlled application route.
    var body: some View {
        // Switches between Firebase loading, Authentication, and the main ECAI application.
        Group {
            // Checks whether Firebase is restoring a saved login session.
            if authService.isLoading {
                // Displays the ECAI loading screen while Firebase checks the session.
                ZStack {
                    // Displays the black ECAI background.
                    Color.black
                        .ignoresSafeArea()
                    // Displays an orange Firebase loading indicator.
                    ProgressView("Connecting to E.C.A.I.")
                        .tint(.orange)
                        .foregroundStyle(.white)
                }
            } else if authService.currentUser == nil {
                // Displays login and registration when no Firebase user is signed in.
                AuthenticationView()
                    // Supplies the owned Firebase Authentication service to the Login screen.
                    .environmentObject(authService)
            } else {
                // Displays the full ECAI application after Firebase confirms a signed-in user.
                ContentView()
                    // Supplies the owned Firebase Authentication service to ECAI and Settings.
                    .environmentObject(authService)
            }
        }
        // Starts Firebase's persistent authentication listener when the gate appears.
        .onAppear {
            authService.startListening()
        }
    }
}
// Displays the complete ECAI login, registration, and password-reset interface.
struct AuthenticationView: View {
    // Receives the shared Firebase Authentication service from ECAI_V2App.
    @EnvironmentObject private var authService: AuthService
    // Stores whether the user is logging in or registering.
    @State private var mode: AuthenticationMode = .login
    // Stores the email address entered by the user.
    @State private var email = ""
    // Stores the password entered by the user.
    @State private var password = ""
    // Stores the repeated password used during registration.
    @State private var confirmPassword = ""
    // Stores local form validation messages before a Firebase request is sent.
    @State private var validationMessage = ""
    // Builds the complete Authentication screen.
    var body: some View {
        // Places every Authentication element over the ECAI background.
        ZStack {
            // Displays the black ECAI background through every safe area.
            Color.black
                .ignoresSafeArea()
            // Allows the Authentication form to scroll on smaller devices.
            ScrollView {
                // Arranges the ECAI identity and form vertically.
                VStack(spacing: 20) {
                    // Displays the official ECAI logo.
                    Image("ECAI_Logo_V1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .shadow(color: .orange.opacity(0.40), radius: 16)
                    // Displays the Elite Contractor AI application name.
                    Text("E.C.A.I.")
                        .font(.system(size: 38, weight: .black))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(red: 1.00, green: 0.70, blue: 0.18),
                                    Color.orange,
                                    Color(red: 1.00, green: 0.38, blue: 0.02)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: .orange.opacity(0.55), radius: 8)
                    // Displays the secure-access description.
                    Text("Secure Business Command Access")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white.opacity(0.82))
                    // Allows the user to switch between Login and Register.
                    Picker(
                        "Authentication Mode",
                        selection: $mode
                    ) {
                        // Displays every supported Authentication mode.
                        ForEach(AuthenticationMode.allCases) { authenticationMode in
                            // Displays one Login or Register option.
                            Text(authenticationMode.rawValue)
                                .tag(authenticationMode)
                        }
                    }
                    .pickerStyle(.segmented)
                    .tint(.orange)
                    // Displays the Firebase Authentication form card.
                    VStack(spacing: 16) {
                        // Collects the user's Firebase email address.
                        TextField(
                            "Email Address",
                            text: $email
                        )
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .authenticationField()
                        // Collects the user's Firebase password.
                        SecureField(
                            "Password",
                            text: $password
                        )
                        .textInputAutocapitalization(.never)
                        .authenticationField()
                        // Displays password confirmation only during registration.
                        if mode == .register {
                            // Collects the repeated registration password.
                            SecureField(
                                "Confirm Password",
                                text: $confirmPassword
                            )
                            .textInputAutocapitalization(.never)
                            .authenticationField()
                        }
                        // Displays local form validation feedback.
                        if validationMessage.isEmpty == false {
                            // Displays the current validation problem.
                            Text(validationMessage)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        // Displays Firebase request errors.
                        if authService.errorMessage.isEmpty == false {
                            // Displays Firebase's exact Authentication error.
                            Text(authService.errorMessage)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        // Displays successful Firebase request messages.
                        if authService.successMessage.isEmpty == false {
                            // Displays Firebase's successful request confirmation.
                            Text(authService.successMessage)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(.green)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        // Submits the Login or Register request to Firebase.
                        Button {
                            // Starts the asynchronous Firebase Authentication request.
                            Task {
                                await submitAuthentication()
                            }
                        } label: {
                            // Displays progress or the current Authentication action.
                            Group {
                                // Checks whether Firebase is processing the form.
                                if authService.isWorking {
                                    // Displays progress while Firebase handles the request.
                                    ProgressView()
                                        .tint(.black)
                                } else {
                                    // Displays Login or Create Account for the selected mode.
                                    Text(mode == .login ? "Login" : "Create Account")
                                        .fontWeight(.black)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                        }
                        .buttonStyle(.plain)
                        .foregroundStyle(.black)
                        .background(Color.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .disabled(authService.isWorking)
                        // Displays password recovery only on the Login form.
                        if mode == .login {
                            // Sends a Firebase password-reset email.
                            Button("Forgot Password?") {
                                // Starts the asynchronous Firebase password-reset request.
                                Task {
                                    await resetPassword()
                                }
                            }
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.orange)
                            .disabled(authService.isWorking)
                        }
                    }
                    .padding(20)
                    .background(Color(red: 0.07, green: 0.06, blue: 0.06))
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.orange.opacity(0.90), lineWidth: 2)
                    )
                    .shadow(color: .orange.opacity(0.25), radius: 12)
                }
                .padding(.horizontal, 22)
                .padding(.top, 40)
                .padding(.bottom, 40)
            }
            .scrollIndicators(.hidden)
        }
        // Clears old feedback whenever the user changes Authentication modes.
        .onChange(of: mode) { _ in
            validationMessage = ""
            authService.clearFeedback()
        }
    }
    // Validates and submits the current Login or Register form.
    private func submitAuthentication() async {
        // Trims accidental spaces around the email address.
        let cleanEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        // Clears the previous local validation message.
        validationMessage = ""
        // Requires an email address before contacting Firebase.
        guard cleanEmail.isEmpty == false else {
            validationMessage = "Enter your email address."
            return
        }
        // Requires a password before contacting Firebase.
        guard password.isEmpty == false else {
            validationMessage = "Enter your password."
            return
        }
        // Handles new-account validation and registration.
        if mode == .register {
            // Requires Firebase's minimum six-character password length.
            guard password.count >= 6 else {
                validationMessage = "Password must contain at least six characters."
                return
            }
            // Requires both registration passwords to match.
            guard password == confirmPassword else {
                validationMessage = "Passwords do not match."
                return
            }
            // Sends the validated registration request to Firebase.
            _ = await authService.register(
                email: cleanEmail,
                password: password
            )
        } else {
            // Sends the validated login request to Firebase.
            _ = await authService.signIn(
                email: cleanEmail,
                password: password
            )
        }
    }
    // Validates the email field and requests a Firebase password-reset email.
    private func resetPassword() async {
        // Trims accidental spaces around the email address.
        let cleanEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        // Clears the previous local validation message.
        validationMessage = ""
        // Requires an email address before requesting password recovery.
        guard cleanEmail.isEmpty == false else {
            validationMessage = "Enter your email address first."
            return
        }
        // Sends the password-reset request to Firebase.
        _ = await authService.sendPasswordReset(
            email: cleanEmail
        )
    }
}
// Creates the reusable ECAI Authentication text-field appearance.
private extension View {
    // Applies the dark field background, white text, and orange border.
    func authenticationField() -> some View {
        // Applies every Authentication field style to the selected view.
        self
            .padding(.horizontal, 14)
            .padding(.vertical, 13)
            .foregroundStyle(.white)
            .background(Color.black.opacity(0.65))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.orange.opacity(0.65), lineWidth: 1.3)
            )
    }
}
// Displays the Authentication screen inside Xcode previews.
#Preview {
    // Creates the ECAI Authentication screen with a preview service.
    AuthenticationView()
        .environmentObject(AuthService())
}
