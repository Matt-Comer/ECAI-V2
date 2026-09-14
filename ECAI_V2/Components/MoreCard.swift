
//
//  MoreCard.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//
//
import SwiftUI
// Creates one reusable navigation card for the More screen.
struct MoreCard: View {
    // Stores the icon displayed on the card.
    let icon: String
    // Stores the main title displayed on the card.
    let title: String
    // Stores the smaller description displayed below the title.
    let subtitle: String

    // Displays the More screen navigation card.
    var body: some View {
        // Places the icon and information on one row.
        HStack(spacing: 16) {
            // Displays the feature icon.
            Image(systemName: icon)
                .font(.system(size: 26, weight: .bold))
                .foregroundStyle(ECAITheme.metallicOrangeTop)
                .frame(width: 42)

            // Places the title and subtitle vertically.
            VStack(alignment: .leading, spacing: 5) {
                // Displays the feature title.
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                // Displays the feature description.
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.70))
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(
            Color(red: 0.08, green: 0.08, blue: 0.09)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 18)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    LinearGradient(
                        colors: [
                            Color(red: 1.00, green: 0.92, blue: 0.60),
                            Color(red: 0.82, green: 0.64, blue: 0.20),
                            Color(red: 1.00, green: 0.96, blue: 0.72)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
        )
        .shadow(
            color: .black.opacity(0.45),
            radius: 12,
            x: 0,
            y: 6
        )
        .shadow(
            color: Color.yellow.opacity(0.16),
            radius: 8
        )
    }
}

#Preview {
    MoreCard(
        icon: "dollarsign.circle.fill",
        title: "Revenue",
        subtitle: "Track monthly income"
    )
}
