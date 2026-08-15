
//
//  MoreCard.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//

import SwiftUI

// Creates one reusable navigation card for the More screen.
struct MoreCard: View {

    // Stores the SF Symbol displayed on the left side of the card.
    let icon: String

    // Stores the main title displayed on the card.
    let title: String

    // Stores the smaller description displayed below the title.
    let subtitle: String

    var body: some View {

        // Places the icon, text, and arrow on one horizontal row.
        HStack(
            spacing: 16
        ) {

            // Displays the feature icon.
            Image(systemName: icon)

                // Sets the icon size.
                .font(.title2)

                // Displays the icon using the application accent colour.
                .foregroundStyle(.orange)

                // Gives every icon the same width.
                .frame(width: 36)

            // Places the title and subtitle vertically.
            VStack(
                alignment: .leading,
                spacing: 5
            ) {

                // Displays the feature title.
                Text(title)

                    // Sets the title font.
                    .font(.headline)

                    // Makes the title bold.
                    .fontWeight(.bold)

                    // Displays the title in white.
                    .foregroundStyle(.white)

                // Displays the feature description.
                Text(subtitle)

                    // Uses a smaller font for the description.
                    .font(.caption)

                    // Makes the description slightly transparent.
                    .foregroundStyle(
                        .white.opacity(0.70)
                    )

            }

            // Pushes the navigation arrow to the right side.
            Spacer()

            // Displays the navigation arrow.
            Image(systemName: "chevron.right")

                // Sets the arrow size.
                .font(.headline)

                // Makes the arrow slightly transparent.
                .foregroundStyle(
                    .white.opacity(0.45)
                )

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

                // Sets the red colour value.
                red: 0.08,

                // Sets the green colour value.
                green: 0.08,

                // Sets the blue colour value.
                blue: 0.09

            )

        )

        // Clips the card into a rounded rectangle.
        .clipShape(

            RoundedRectangle(

                // Sets the corner radius.
                cornerRadius: 18

            )

        )

        // Adds the metallic gold border around the card.
        .overlay(

            // Creates the rounded border shape.
            RoundedRectangle(
                cornerRadius: 18
            )

            // Draws the border around the card.
            .stroke(

                // Creates the metallic gold gradient.
                LinearGradient(

                    // Defines the colours used by the gradient.
                    colors: [

                        // Bright gold highlight.
                        Color(
                            red: 1.00,
                            green: 0.92,
                            blue: 0.60
                        ),

                        // Dark metallic gold.
                        Color(
                            red: 0.82,
                            green: 0.64,
                            blue: 0.20
                        ),

                        // Light gold reflection.
                        Color(
                            red: 1.00,
                            green: 0.96,
                            blue: 0.72
                        )

                    ],

                    // Starts the gradient in the upper-left corner.
                    startPoint: .topLeading,

                    // Ends the gradient in the lower-right corner.
                    endPoint: .bottomTrailing

                ),

                // Sets the border thickness.
                lineWidth: 1.5

            )

        )

        // Adds a subtle black shadow below the card.
        .shadow(

            // Sets the shadow colour.
            color: .black.opacity(0.45),

            // Sets the blur radius.
            radius: 12,

            // Keeps the shadow centered horizontally.
            x: 0,

            // Moves the shadow slightly downward.
            y: 6

        )

        // Adds a soft gold glow around the card.
        .shadow(

            // Sets the glow colour.
            color: Color.yellow.opacity(0.16),

            // Sets the glow size.
            radius: 8

        )

    }

}

// Displays the MoreCard inside the Xcode preview.
#Preview {

    // Creates a preview of the reusable More card.
    MoreCard(

        // Displays the preview icon.
        icon: "dollarsign.circle.fill",

        // Displays the preview title.
        title: "Revenue",

        // Displays the preview description.
        subtitle: "Track monthly income"

    )

}
