
//
//  AIAssistantView.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//

import SwiftUI
// Identifies the working agent selected inside the E.C.A.I. Command Center.
private enum ECAIWorkspace: String, Identifiable {
    // Opens the Customer Success Agent.
    case customer
    // Opens the Marketing Intelligence Agent.
    case marketing
    // Opens the Project Intelligence Agent for material planning.
    case materials
    // Opens the Project Intelligence Agent for contract drafting.
    case contract
    // Uses the workspace name as its stable SwiftUI identifier.
    var id: String {
        rawValue
    }
    // Stores the title displayed at the top of the workspace.
    var title: String {
        // Returns the correct title for the selected workspace.
        switch self {
        case .customer:
            return "CUSTOMER FOLLOW-UP"
        case .marketing:
            return "MARKETING IDEAS"
        case .materials:
            return "MATERIAL ESTIMATOR"
        case .contract:
            return "CONTRACT GENERATOR"
        }
    }
    // Stores the existing E.C.A.I. agent used by the workspace.
    var agentName: String {
        // Routes every workspace to an existing agent.
        switch self {
        case .customer:
            return "Customer Success Agent"
        case .marketing:
            return "Marketing Intelligence Agent"
        case .materials, .contract:
            return "Project Intelligence Agent"
        }
    }
    // Stores the instruction displayed before the user enters information.
    var instructions: String {
        // Returns the correct instructions for the selected tool.
        switch self {
        case .customer:
            return "Enter the customer name, project details, and the message you need."
        case .marketing:
            return "Enter the service, location, audience, and marketing goal."
        case .materials:
            return "Enter the project type, measurements, scope, and known materials."
        case .contract:
            return "Enter the customer, project scope, price, payment schedule, dates, and warranty."
        }
    }
    // Stores the task instruction added before the user's information.
    var requestPrefix: String {
        // Returns the correct task for Firebase AI.
        switch self {
        case .customer:
            return "Create a professional customer follow-up message using these details:"
        case .marketing:
            return "Create a practical contractor marketing campaign using these details:"
        case .materials:
            return "Create a detailed material estimate and identify quantities that still require confirmation using these details:"
        case .contract:
            return "Create a professional draft contractor service agreement. Include scope, exclusions, payment schedule, changes, delays, warranty, cleanup, and customer approval. Clearly label it as a draft requiring review. Use these details:"
        }
    }
    // Stores the icon used by the workspace.
    var icon: String {
        // Returns the matching system icon.
        switch self {
        case .customer:
            return "message.fill"
        case .marketing:
            return "megaphone.fill"
        case .materials:
            return "hammer.fill"
        case .contract:
            return "doc.richtext.fill"
        }
    }
}
// Displays the main AI Command Center for Elite Contractor AI.
struct AIAssistantView: View {
    // Controls when the Generate Quote screen is displayed.
    @State private var showQuoteSheet = false
    // Stores the additional E.C.A.I. agent workspace selected by the user.
    @State private var selectedWorkspace: ECAIWorkspace?
    // Creates the metallic gold gradient.
    private var goldGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.88, blue: 0.45),
                Color(red: 0.83, green: 0.69, blue: 0.22),
                Color(red: 0.67, green: 0.49, blue: 0.10)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    var body: some View {
        // Creates the navigation system for the AI Assistant.
        NavigationStack {
            // Places the background and simplified Command Center in layers.
            ZStack {
                // Displays the looping video background.
                VideoBackgroundView(
                    videoName: "ECAI_V_01"
                )
                .ignoresSafeArea()
                // Darkens the video so every control remains readable.
                Color.black
                    .opacity(0.38)
                    .ignoresSafeArea()
                // Allows the complete Command Center to scroll above the tab bar.
                ScrollView {
                    // Places the single header and compact tool area vertically.
                    VStack(
                        spacing: 16
                    ) {
                        // Uses one existing E.C.A.I. hero instead of three repeated introductions.
                        ECAIHeroView(
                            imageName: "ECAI-splashscreen-V10",
                            title: "COMMAND CENTER",
                            subtitle: "Quotes, customers, marketing, and projects."
                        )
                        // Labels the working tool section.
                        Text("CHOOSE A TOOL")
                            .font(.system(size: 18, weight: .black))
                            .foregroundStyle(goldGradient)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        // Opens the Generate Quote screen.
                        Button {
                            // Displays the Generate Quote sheet.
                            showQuoteSheet = true
                        } label: {
                            // Creates the primary Generate Quote control.
                            Label(
                                "Generate Quote",
                                systemImage: "doc.text.fill"
                            )
                            .font(.system(size: 18, weight: .black))
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 58)
                            .background(ECAITheme.orangeMetal)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(ECAITheme.orangeMetal, lineWidth: 1.5)
                            )
                            .shadow(
                                color: ECAITheme.metallicOrange.opacity(0.30),
                                radius: 8
                            )
                        }
                        // Places the four supporting agents inside a compact two-column grid.
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible(), spacing: 12),
                                GridItem(.flexible(), spacing: 12)
                            ],
                            spacing: 12
                        ) {
                            // Opens the working Customer Success Agent.
                            Button {
                                // Opens the Customer Success Agent workspace.
                                selectedWorkspace = .customer
                            } label: {
                                // Creates the compact Customer Follow-Up control.
                                VStack(spacing: 8) {
                                    // Displays the customer communication symbol.
                                    Image(systemName: "message.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(goldGradient)
                                    // Displays the customer agent title.
                                    Text("Customer Follow-Up")
                                        .font(.system(size: 15, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(goldGradient)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 92)
                                .background(Color.black.opacity(0.72))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(goldGradient, lineWidth: 1.5)
                                )
                                .shadow(
                                    color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.18),
                                    radius: 7
                                )
                            }
                            // Opens the working Marketing Intelligence Agent.
                            Button {
                                // Opens the Marketing Intelligence Agent workspace.
                                selectedWorkspace = .marketing
                            } label: {
                                // Creates the compact Marketing Ideas control.
                                VStack(spacing: 8) {
                                    // Displays the marketing symbol.
                                    Image(systemName: "megaphone.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(goldGradient)
                                    // Displays the marketing agent title.
                                    Text("Marketing Ideas")
                                        .font(.system(size: 15, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(goldGradient)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 92)
                                .background(Color.black.opacity(0.72))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(goldGradient, lineWidth: 1.5)
                                )
                                .shadow(
                                    color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.18),
                                    radius: 7
                                )
                            }
                            // Opens the working Material Estimator.
                            Button {
                                // Opens the Project Intelligence material workspace.
                                selectedWorkspace = .materials
                            } label: {
                                // Creates the compact Material Estimator control.
                                VStack(spacing: 8) {
                                    // Displays the material planning symbol.
                                    Image(systemName: "hammer.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(goldGradient)
                                    // Displays the material agent title.
                                    Text("Material Estimator")
                                        .font(.system(size: 15, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(goldGradient)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 92)
                                .background(Color.black.opacity(0.72))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(goldGradient, lineWidth: 1.5)
                                )
                                .shadow(
                                    color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.18),
                                    radius: 7
                                )
                            }
                            // Opens the working Contract Generator.
                            Button {
                                // Opens the Project Intelligence contract workspace.
                                selectedWorkspace = .contract
                            } label: {
                                // Creates the compact Contract Generator control.
                                VStack(spacing: 8) {
                                    // Displays the contract symbol.
                                    Image(systemName: "doc.richtext.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(goldGradient)
                                    // Displays the contract agent title.
                                    Text("Contract Generator")
                                        .font(.system(size: 15, weight: .bold))
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(goldGradient)
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 92)
                                .background(Color.black.opacity(0.72))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(goldGradient, lineWidth: 1.5)
                                )
                                .shadow(
                                    color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.18),
                                    radius: 7
                                )
                            }
                        }
                    }
                    // Adds space around the simplified interface.
                    .padding(.horizontal, 16)
                    // Keeps the header below the device safe area.
                    .padding(.top, 12)
                    // Keeps the final row above the permanent tab bar.
                    .padding(.bottom, 120)
                }
                // Hides the scroll indicator for a cleaner Command Center.
                .scrollIndicators(.hidden)
            }
            // Displays the Generate Quote screen.
            .sheet(
                isPresented: $showQuoteSheet
            ) {
                // Opens the Generate Quote screen.
                GenerateQuoteView()
            }
            // Displays the selected working E.C.A.I. agent.
            .fullScreenCover(
                item: $selectedWorkspace
            ) { workspace in
                // Opens one reusable agent workspace without changing the Command Center design.
                ECAIAgentWorkspaceView(
                    workspace: workspace
                )
            }
        }
    }
}
// Displays one reusable working screen for Customer, Marketing, Material, or Contract intelligence.
private struct ECAIAgentWorkspaceView: View {
    // Allows the Done button to close the selected workspace.
    @Environment(\.dismiss) private var dismiss
    // Stores the selected agent workspace configuration.
    let workspace: ECAIWorkspace
    // Creates the shared E.C.A.I. Intelligence Engine.
    private let engine = IntelligenceEngine()
    // Stores the project or customer information entered by the user.
    @State private var input = ""
    // Stores the response returned by Firebase AI or the local fallback agent.
    @State private var response = ""
    // Stores whether the agent is currently generating a response.
    @State private var isGenerating = false
    // Creates the metallic gold gradient.
    private var goldGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.88, blue: 0.45),
                Color(red: 0.83, green: 0.69, blue: 0.22),
                Color(red: 0.67, green: 0.49, blue: 0.10)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    // Builds the complete E.C.A.I. agent workspace.
    var body: some View {
        // Creates navigation for the workspace toolbar.
        NavigationStack {
            // Places the complete workspace over the black E.C.A.I. background.
            ZStack {
                // Displays the black application background.
                Color.black
                    .ignoresSafeArea()
                // Allows long agent results to scroll.
                ScrollView {
                    // Places the workspace controls and result vertically.
                    VStack(
                        alignment: .leading,
                        spacing: 18
                    ) {
                        // Displays the selected agent icon.
                        Image(
                            systemName: workspace.icon
                        )
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(goldGradient)
                        // Displays the selected workspace title.
                        Text(workspace.title)
                            .font(.system(size: 28, weight: .black))
                            .foregroundStyle(goldGradient)
                        // Displays the information required by the selected agent.
                        Text(workspace.instructions)
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.78))
                        // Allows the user to enter the complete agent request.
                        TextEditor(
                            text: $input
                        )
                        .scrollContentBackground(.hidden)
                        .foregroundStyle(.white)
                        .frame(minHeight: 160)
                        .padding(12)
                        .background(
                            Color(
                                red: 0.07,
                                green: 0.06,
                                blue: 0.06
                            )
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 16
                            )
                        )
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 16
                            )
                            .stroke(
                                goldGradient,
                                lineWidth: 1.5
                            )
                        )
                        .shadow(
                            color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.18),
                            radius: 7
                        )
                        // Starts the selected E.C.A.I. agent.
                        Button {
                            // Runs the Firebase AI request without freezing the interface.
                            Task {
                                await generateResponse()
                            }
                        } label: {
                            // Displays progress or the Generate button title.
                            HStack {
                                // Checks whether the agent is currently working.
                                if isGenerating {
                                    // Displays the working indicator.
                                    ProgressView()
                                        .tint(.black)
                                }
                                // Displays the agent action.
                                Text(
                                    isGenerating ? "E.C.A.I. Working..." : "Generate"
                                )
                                .fontWeight(.black)
                            }
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(goldGradient)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        // Displays the completed agent heading.
                        .disabled(isGenerating)
                        // Checks whether the agent created a response.
                        if !response.isEmpty {
                            // Displays the generated response inside an E.C.A.I. card.
                            VStack(
                                alignment: .leading,
                                spacing: 14
                            ) {
                                Label(
                                    "E.C.A.I. Response",
                                    systemImage: "sparkles"
                                )
                                .font(.headline)
                                .foregroundStyle(goldGradient)
                                // Displays the generated agent content.
                                Text(response)
                                    .textSelection(.enabled)
                                    .foregroundStyle(.white)
                                // Allows the completed response to be shared with another application.
                                ShareLink(
                                    item: response
                                ) {
                                    // Displays the Share button.
                                    Label(
                                        "Share",
                                        systemImage: "square.and.arrow.up"
                                    )
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                }
                                .buttonStyle(.bordered)
                                .tint(
                                    Color(red: 0.83, green: 0.69, blue: 0.22)
                                )
                            }
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(18)
                            .background(
                                Color(
                                    red: 0.08,
                                    green: 0.07,
                                    blue: 0.07
                                )
                            )
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 18
                                )
                            )
                            .overlay(
                                RoundedRectangle(
                                    cornerRadius: 18
                                )
                                .stroke(
                                    goldGradient,
                                    lineWidth: 1.5
                                )
                            )
                            .shadow(
                                color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.18),
                                radius: 7
                            )
                        }
                    }
                    .padding()
                    .padding(.bottom, 30)
                }
            }
            // Forces the navigation area above the workspace to stay black.
            .toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            // Displays the workspace toolbar.
            .toolbar {
                // Creates the Done button.
                ToolbarItem(
                    placement: .topBarTrailing
                ) {
                    // Closes the selected workspace.
                    Button("Done") {
                        // Dismisses the current workspace.
                        dismiss()
                    }
                    .tint(
                        Color(red: 0.83, green: 0.69, blue: 0.22)
                    )
                }
            }
        }
    }
    // Sends the workspace request through Firebase AI Logic.
    private func generateResponse() async {
        // Shows that the selected agent is working.
        isGenerating = true
        // Clears the previous response before a new request begins.
        response = ""
        // Builds the complete request for the selected workspace.
        let completeRequest = """
        \(workspace.requestPrefix)
        \(input)
        """
        // Requests a live response with the local agent kept as the free fallback.
        response = await engine.generateResponse(
            using: workspace.agentName,
            input: completeRequest
        )
        // Ends the working indicator.
        isGenerating = false
    }
}
// Displays the AI Assistant screen inside Xcode.
#Preview {
    // Creates a preview of the AI Assistant screen.
    AIAssistantView()
}
