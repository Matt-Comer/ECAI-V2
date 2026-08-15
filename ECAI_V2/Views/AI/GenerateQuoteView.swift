//
//  GenerateQuoteView.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//

import SwiftUI

// Displays the AI Quote Generator screen.
struct GenerateQuoteView: View {

    // Allows the Done button to close this screen.
    @Environment(\.dismiss) var dismiss

    // Stores the job type entered by the user.
    @State private var jobType = ""

    // Stores the project size entered by the user.
    @State private var size = ""

    // Stores the materials entered by the user.
    @State private var materials = ""

    // Stores any additional notes entered by the user.
    @State private var notes = ""

    // Stores the AI generated quote.
    @State private var quoteText = ""

    var body: some View {

        // Creates the navigation system for this screen.
        NavigationStack {

            // Places the background behind the interface.
            ZStack {

                // Displays the black application background.
                Color.black
                    .ignoresSafeArea()

                // Allows the content to scroll.
                ScrollView {

                    // Places every section vertically.
                    VStack(
                        spacing: 20
                    ) {

                        // Displays the main screen title.
                        ECAIMetallicTitle(text: "GENERATE QUOTE", size: 30)

                        // Displays the screen description.
                        Text("Enter the project information below and let Elite Contractor AI prepare a draft quote.")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(
                                .white.opacity(0.75)
                            )

                        // Allows the user to enter the job type.
                        TextField(
                            "Job Type",
                            text: $jobType
                        )

                        // Uses the standard rounded text field style.
                        .textFieldStyle(.roundedBorder)

                        // Allows the user to enter the project size.
                        TextField(
                            "Project Size",
                            text: $size
                        )

                        // Uses the standard rounded text field style.
                        .textFieldStyle(.roundedBorder)

                        // Allows the user to enter the materials.
                        TextField(
                            "Materials",
                            text: $materials
                        )

                        // Uses the standard rounded text field style.
                        .textFieldStyle(.roundedBorder)

                        // Allows the user to enter additional notes.
                        TextField(
                            "Additional Notes",
                            text: $notes
                        )

                        // Uses the standard rounded text field style.
                        .textFieldStyle(.roundedBorder)

                        // Creates the Generate Quote button.
                        Button {

                            // Builds the AI quote using the information entered by the user.
                            quoteText = """
                            Job Type: \(jobType)

                            Project Size: \(size)

                            Materials: \(materials)

                            Notes: \(notes)

                            Estimated Quote:

                            Review the project details, calculate labour, material costs, equipment, overhead, and prepare the final customer estimate.
                            """

                        } label: {

                            // Displays the button label.
                            Label(
                                "Generate Quote",
                                systemImage: "sparkles"
                            )
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()

                        }

                        // Uses the prominent system button style.
                        .buttonStyle(.borderedProminent)

                        // Displays the generated quote only after it has been created.
                        if !quoteText.isEmpty {

                            // Creates the generated quote card.
                            VStack(
                                alignment: .leading,
                                spacing: 12
                            ) {

                                // Displays the AI icon.
                                Image(systemName: "sparkles")
                                    .font(.title2)
                                    .foregroundStyle(.orange)

                                // Displays the generated quote.
                                Text(quoteText)
                                    .foregroundStyle(.white)

                            }

                            // Allows the card to fill the available width.
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )

                            // Adds spacing inside the quote card.
                            .padding(18)

                            // Creates the premium card background.
                            .background(

                                Color(
                                    red: 0.08,
                                    green: 0.08,
                                    blue: 0.09
                                )

                            )

                            // Clips the card into a rounded rectangle.
                            .clipShape(

                                RoundedRectangle(
                                    cornerRadius: 18
                                )

                            )

                            // Adds a metallic gold border.
                            .overlay(

                                RoundedRectangle(
                                    cornerRadius: 18
                                )
                                .stroke(

                                    LinearGradient(

                                        colors: [

                                            Color(
                                                red: 1.00,
                                                green: 0.92,
                                                blue: 0.60
                                            ),

                                            Color(
                                                red: 0.82,
                                                green: 0.64,
                                                blue: 0.20
                                            ),

                                            Color(
                                                red: 1.00,
                                                green: 0.96,
                                                blue: 0.72
                                            )

                                        ],

                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing

                                    ),

                                    lineWidth: 1.5

                                )

                            )

                            // Adds a subtle black shadow below the card.
                            .shadow(
                                color: .black.opacity(0.45),
                                radius: 12,
                                x: 0,
                                y: 6
                            )

                            // Adds a soft gold glow around the card.
                            .shadow(
                                color: Color.yellow.opacity(0.16),
                                radius: 8
                            )

                        }

                        // Pushes the content toward the top.
                        Spacer()

                    }

                    // Adds spacing around the screen.
                    .padding()

                }

            }

            // Displays the toolbar.
            .toolbar {

                // Creates the Done button.
                ToolbarItem(
                    placement: .topBarTrailing
                ) {

                    // Closes the Generate Quote screen.
                    Button("Done") {

                        // Dismisses the sheet.
                        dismiss()

                    }

                }

            }

        }

    }

}

// Displays the Generate Quote screen inside Xcode.
#Preview {

    // Creates a preview of the Generate Quote screen.
    GenerateQuoteView()

}

