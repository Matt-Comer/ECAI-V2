
//
//  RevenueView.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//

import SwiftUI

// Displays the Revenue screen for Elite Contractor AI.
struct RevenueView: View {

    var body: some View {

        // Creates the navigation system for the Revenue screen.
        NavigationStack {

            // Places the background behind the Revenue content.
            ZStack {

                // Displays the black application background.
                Color.black
                    .ignoresSafeArea()

                // Places every Revenue section vertically.
                VStack(
                    alignment: .leading,
                    spacing: 22
                ) {

                    // Displays the main screen title.
                    ECAIMetallicTitle(text: "REVENUE")

                    // Displays the monthly revenue summary card.
                    VStack(
                        alignment: .leading,
                        spacing: 10
                    ) {

                        // Displays the revenue heading.
                        Text("This Month")
                            .font(.headline)
                            .foregroundStyle(
                                .white.opacity(0.75)
                            )

                        // Displays the total monthly revenue.
                        Text("$8,450")
                            .font(
                                .system(
                                    size: 44,
                                    weight: .black
                                )
                            )
                            .foregroundStyle(.orange)

                        // Displays a short description.
                        Text("Current income from completed and active work.")
                            .font(.subheadline)
                            .foregroundStyle(
                                .white.opacity(0.70)
                            )

                    }

                    // Allows the revenue card to fill the available width.
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

                    // Adds spacing inside the revenue card.
                    .padding(18)

                    // Creates the premium revenue card background.
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

                    // Adds the metallic gold border.
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

                    // Adds a subtle black shadow.
                    .shadow(
                        color: .black.opacity(0.45),
                        radius: 12,
                        x: 0,
                        y: 6
                    )

                    // Adds a soft gold glow.
                    .shadow(
                        color: Color.yellow.opacity(0.16),
                        radius: 8
                    )

                    // Displays the Approved Quotes card.
                    RevenueCard(
                        title: "Approved Quotes",
                        value: "$5,200"
                    )

                    // Displays the Pending Quotes card.
                    RevenueCard(
                        title: "Pending Quotes",
                        value: "$3,100"
                    )

                    // Displays the Projected Revenue card.
                    RevenueCard(
                        title: "Projected Revenue",
                        value: "$11,550"
                    )

                    // Pushes the Revenue content toward the top.
                    Spacer()

                }

                // Adds spacing around the Revenue screen.
                .padding()

            }

        }

    }

}

// Creates one reusable revenue information card.
struct RevenueCard: View {

    // Stores the revenue card title.
    let title: String

    // Stores the revenue value.
    let value: String

    var body: some View {

        // Places the revenue information vertically.
        VStack(
            alignment: .leading,
            spacing: 8
        ) {

            // Displays the revenue card title.
            Text(title)

                // Uses the subheadline font.
                .font(.subheadline)

                // Makes the title slightly transparent.
                .foregroundStyle(
                    .white.opacity(0.70)
                )

            // Displays the revenue value.
            Text(value)

                // Uses a bold title font.
                .font(.title2)

                // Makes the value bold.
                .fontWeight(.bold)

                // Displays the value using the application accent colour.
                .foregroundStyle(.orange)

        }

        // Allows the card to fill the available width.
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )

        // Adds spacing inside the card.
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

        // Adds the metallic gold border.
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

        // Adds a subtle black shadow.
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

}

// Displays the Revenue screen inside the Xcode preview.
#Preview {

    // Creates a preview of the Revenue screen.
    RevenueView()

}
