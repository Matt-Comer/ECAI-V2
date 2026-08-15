//
//  AuthService.swift
//  ECAI_V2
//
//  Created by matthew comer on 2026-08-10.
//

import Foundation
// Imports Combine so authentication changes update SwiftUI immediately.
import Combine
// Imports FirebaseCore so the service can confirm Firebase is configured before using Authentication.
import FirebaseCore
// Imports FirebaseAuth for account registration, login, logout, and password recovery.
import FirebaseAuth
// Keeps every authentication state change on the main thread used by SwiftUI.
@MainActor
final class AuthService: ObservableObject {
    // Stores the Firebase user who is currently signed in.
    @Published private(set) var currentUser: User?
    // Stores whether Firebase is checking the saved authentication session.
    @Published private(set) var isLoading = true
    // Stores whether a login, registration, or password-reset request is running.
    @Published private(set) var isWorking = false
    // Stores the latest Firebase error displayed by the Authentication screen.
    @Published private(set) var errorMessage = ""
    // Stores the latest successful authentication message.
    @Published private(set) var successMessage = ""
    // Stores Firebase's authentication-state listener so it is registered only once.
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    // Starts listening for saved login sessions and future authentication changes.
    func startListening() {
        // Prevents the application from registering the same listener more than once.
        guard authStateHandle == nil else {
            return
        }
        // Confirms FirebaseCore finished configuring before FirebaseAuth is used.
        guard FirebaseApp.app() != nil else {
            errorMessage = "Firebase is not configured."
            isLoading = false
            return
        }
        // Registers the Firebase listener that restores login sessions automatically.
        authStateHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            // Updates the published user whenever Firebase login state changes.
            self?.currentUser = user
            // Ends the initial saved-session check.
            self?.isLoading = false
        }
    }
    // Registers a new ECAI user with an email address and password.
    func register(email: String, password: String) async -> Bool {
        // Clears feedback left by an earlier authentication request.
        clearFeedback()
        // Shows that Firebase is processing the registration request.
        isWorking = true
        // Guarantees the working state ends after success or failure.
        defer {
            isWorking = false
        }
        do {
            // Creates the Firebase Authentication account.
            let result = try await Auth.auth().createUser(
                withEmail: email,
                password: password
            )
            // Sends a verification email to the new account.
            try await result.user.sendEmailVerification()
            // Stores the successful registration message.
            successMessage = "Account created. A verification email was sent."
            // Confirms that registration completed successfully.
            return true
        } catch {
            // Displays Firebase's exact registration error.
            errorMessage = error.localizedDescription
            // Confirms that registration did not complete.
            return false
        }
    }
    // Signs an existing ECAI user into Firebase Authentication.
    func signIn(email: String, password: String) async -> Bool {
        // Clears feedback left by an earlier authentication request.
        clearFeedback()
        // Shows that Firebase is processing the login request.
        isWorking = true
        // Guarantees the working state ends after success or failure.
        defer {
            isWorking = false
        }
        do {
            // Signs in with the supplied Firebase email and password.
            try await Auth.auth().signIn(
                withEmail: email,
                password: password
            )
            // Stores the successful login message.
            successMessage = "Login successful."
            // Confirms that login completed successfully.
            return true
        } catch {
            // Displays Firebase's exact login error.
            errorMessage = error.localizedDescription
            // Confirms that login did not complete.
            return false
        }
    }
    // Sends a Firebase password-reset email to the supplied address.
    func sendPasswordReset(email: String) async -> Bool {
        // Clears feedback left by an earlier authentication request.
        clearFeedback()
        // Shows that Firebase is processing the password-reset request.
        isWorking = true
        // Guarantees the working state ends after success or failure.
        defer {
            isWorking = false
        }
        do {
            // Requests Firebase's secure password-reset email.
            try await Auth.auth().sendPasswordReset(
                withEmail: email
            )
            // Stores the successful password-reset message.
            successMessage = "Password-reset email sent."
            // Confirms that the password-reset request completed.
            return true
        } catch {
            // Displays Firebase's exact password-reset error.
            errorMessage = error.localizedDescription
            // Confirms that the password-reset request did not complete.
            return false
        }
    }
    // Signs the current ECAI user out of Firebase Authentication.
    func signOut() {
        // Clears feedback left by an earlier authentication request.
        clearFeedback()
        do {
            // Ends the current Firebase Authentication session.
            try Auth.auth().signOut()
            // Stores the successful logout message.
            successMessage = "Signed out successfully."
        } catch {
            // Displays Firebase's exact logout error.
            errorMessage = error.localizedDescription
        }
    }
    // Clears all authentication feedback before a new request begins.
    func clearFeedback() {
        // Removes the previous Firebase error.
        errorMessage = ""
        // Removes the previous successful request message.
        successMessage = ""
    }
}
