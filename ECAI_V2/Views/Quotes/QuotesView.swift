//
//  QuotesView.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
// Displays the Quotes screen for Elite Contractor AI.
struct QuotesView: View {
    // Stores the sample quote information displayed on this screen.
    let quotes = [
        // Creates the first sample quote.
        Quote(
            customerName: "Frank",
            amount: 2500,
            status: "Sent"
        ),
        // Creates the second sample quote.
        Quote(
            customerName: "Clint",
            amount: 850,
            status: "Draft"
        ),
        // Creates the third sample quote.
        Quote(
            customerName: "Jessica",
            amount: 6200,
            status: "Approved"
        )
    ]
    var body: some View {
        // Creates the navigation system for this screen.
        NavigationStack {
            // Places the background behind the quote content.
            ZStack {
                // Displays the black application background.
                Color.black
                    .ignoresSafeArea()
                // Allows the quote list to scroll vertically.
                ScrollView {
                    // Places every section of the screen vertically.
                    VStack(
                        alignment: .leading,
                        spacing: 22
                    ) {
                        // Displays the same solid header used by the other main screens.
                        ZStack(
                            alignment: .topLeading
                        ) {
                            // Displays the matte-black header background.
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                            .fill(
                                Color(
                                    red: 0.055,
                                    green: 0.045,
                                    blue: 0.045
                                )
                            )
                            // Displays the metallic orange header border.
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                            .stroke(
                                ECAITheme.orangeMetal,
                                lineWidth: 2
                            )
                            // Displays the correct Dashboard logo.
                            Image("ECAI-Logo-#1")
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    width: 78,
                                    height: 78
                                )
                                .clipShape(
                                    RoundedRectangle(
                                        cornerRadius: 16
                                    )
                                )
                                .padding(.leading, 16)
                                .padding(.top, 14)
                            // Displays the same social icons used on Dashboard, Customers, and Jobs.
                            HStack(
                                spacing: 5
                            ) {
                                // Displays the Facebook icon.
                                Image("facebook")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 31, height: 31)
                                // Displays the LinkedIn icon.
                                Image("LinkedInIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 31, height: 31)
                                // Displays the X icon.
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
                            // Displays the centered E.C.A.I. title and Quotes subtitle.
                            VStack(
                                spacing: 5
                            ) {
                                // Displays the metallic orange E.C.A.I. title.
                                Text("E.C.A.I.")
                                    .font(
                                        .system(
                                            size: 34,
                                            weight: .black
                                        )
                                    )
                                    .foregroundStyle(
                                        ECAITheme.orangeMetal
                                    )
                                    .shadow(
                                        color: .orange.opacity(0.55),
                                        radius: 8
                                    )
                                // Displays the Quotes page subtitle.
                                Text("Q.C.")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundStyle(
                                        .white.opacity(0.92)
                                    )
                            }
                            .frame(
                                maxWidth: .infinity
                            )
                            .padding(.top, 50)
                            .padding(.horizontal, 115)
                        }
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
                        // Displays the Quotes PNG using the same layout as Customers.
                        ZStack(
                            // Anchors the Quotes text to the lower-left corner.
                            alignment: .bottomLeading
                        ) {
                            // Displays the complete Quotes PNG without cropping the people.
                            Image("ECAI_ClientPresentation_V1")
                                // Allows the Quotes PNG to resize.
                                .resizable()
                                // Fits the complete PNG like the Customers PNG.
                                .scaledToFit()
                                // Expands the complete artwork across the available width.
                                .frame(
                                    maxWidth: .infinity
                                )
                            // Adds the same bottom fade used over the Customers PNG.
                            LinearGradient(
                                colors: [
                                    // Keeps the upper artwork visible.
                                    Color.orange.opacity(0.04),
                                    // Adds the middle orange tint.
                                    Color.orange.opacity(0.16),
                                    // Darkens the bottom so the text stays readable.
                                    Color.black.opacity(0.95)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            // Displays the Quotes title and description over the PNG.
                            VStack(
                                alignment: .leading,
                                spacing: 4
                            ) {
                                // Displays the Quotes hero heading.
                                Text("QUOTE INTELLIGENCE")
                                    .font(
                                        .system(
                                            size: 28,
                                            weight: .black
                                        )
                                    )
                                    .foregroundStyle(
                                        ECAITheme.orangeMetal
                                    )
                                    .shadow(
                                        color: .black,
                                        radius: 3,
                                        x: 0,
                                        y: 2
                                    )
                                // Displays the Quotes hero description.
                                Text("Build estimates, approvals, and customer proposals.")
                                    .font(.subheadline)
                                    .foregroundStyle(
                                        .white.opacity(0.82)
                                    )
                            }
                            // Uses the same text padding as Customers.
                            .padding(16)
                        }
                        // Uses the same rounded shape as the Customers PNG.
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                        )
                        // Uses the same orange border as the Customers PNG.
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 22
                            )
                            .stroke(
                                Color.orange.opacity(0.90),
                                lineWidth: 2
                            )
                        )
                        // Uses the same orange glow as the Customers PNG.
                        .shadow(
                            color: .orange.opacity(0.25),
                            radius: 10
                        )
                        // Loops through every quote stored in the quotes array.
                        ForEach(quotes) { quote in
                            // Creates one reusable quote card.
                            VStack(
                                alignment: .leading,
                                spacing: 12
                            ) {
                                // Displays the customer's name.
                                Text(quote.customerName)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                // Displays the total dollar amount for the quote.
                                Text("$\(quote.amount, specifier: "%.0f")")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.orange)
                                // Places the quote status icon and text on one row.
                                HStack(
                                    spacing: 10
                                ) {
                                    // Displays the document icon.
                                    Image(systemName: "doc.text.fill")
                                        .foregroundStyle(.orange)
                                    // Displays the current quote status.
                                    Text(quote.status)
                                        .foregroundStyle(
                                            .white.opacity(0.85)
                                        )
                                }
                            }
                            // Allows the quote card to fill the available width.
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            // Adds spacing inside the quote card.
                            .padding()
                            // Creates the dark background for the quote card.
                            .background(
                                Color(
                                    red: 0.08,
                                    green: 0.08,
                                    blue: 0.09
                                )
                            )
                            // Rounds the corners of the quote card.
                            .cornerRadius(18)
                            // Adds the original metallic gold border around the quote card.
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
                                    lineWidth: 1.4
                                )
                            )
                            // Adds the original soft gold glow behind the quote card.
                            .shadow(
                                color: Color.yellow.opacity(0.16),
                                radius: 8
                            )
                        }
                        // Pushes the content toward the top of the screen.
                        Spacer()
                    }
                    // Adds the original spacing around the screen content.
                    .padding()
                }
            }
        }
    }
}
// Displays the Quotes screen inside the Xcode preview.
#Preview {
    // Creates a preview of the Quotes screen.
    QuotesView()
}
