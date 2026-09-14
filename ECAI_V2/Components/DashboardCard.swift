//
//  DashboardCard.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//

import SwiftUI
// Creates one reusable dashboard statistic card.
struct DashboardCard: View {
    // Stores the title displayed on the dashboard card.
    let title: String
    // Stores the dashboard value displayed inside the card.
    let value: String
// Displays the dashboard card.
    var body: some View {
    // Places the dashboard information vertically.
        VStack(alignment: .center, spacing: 6) {
        // Displays the dashboard  value.
            Text(value)
                .font(.system(size: 34, weight: .black))
                .foregroundStyle(.orange)
            // Displays the  dashboard title.
            Text(title.uppercased())
                .font(.caption)
                .fontWeight(.bold)
                .tracking(1.2)
                .foregroundStyle(.white.opacity(0.75))
        }
        //  Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .center)
    // Adds spacing inside the dashboard card.
        .padding(18)
        // Creates the premium dashboard card background.
        .background(
            Color(red: 0.08, green: 0.08, blue: 0.09)
        )
        //  Rounds the dashboard card corners.
        .clipShape(RoundedRectangle(cornerRadius: 18))
        // Adds a metallic gold border around the dashboard card.
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
    // Adds a subtle black shadow below the  dashboard card.
        .shadow(
            color: .black.opacity(0.45),
            radius: 12,
            x: 0,
            y: 6
        )
        // Adds  a soft gold glow around the dashboard card.
        .shadow(
            color: Color.yellow.opacity(0.16),
            radius: 8
        )
    }
}
// Displays  the dashboard card inside the Xcode preview.
#Preview {
    // Creates a preview of one dashboard card.
    DashboardCard(
        title: "Active Jobs",
        value: "3"
    )
}
