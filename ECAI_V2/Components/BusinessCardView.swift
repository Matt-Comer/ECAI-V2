//
//  BusinessCardView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-17.
//

import SwiftUI

// Displays one reusable Business Profile information card.
struct BusinessCardView: View {
    // Stores the image displayed inside the card.
    let imageName: String
    // Stores the title displayed inside the card.
    let title: String
    // Stores the description displayed inside the card.
    let description: String
    // Displays the Business Profile card interface.
    var body: some View {
        // Places the card content vertically.
        VStack(alignment: .leading, spacing: 0) {
            // Displays the Business Profile image.
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 165)
                .frame(maxWidth: .infinity)
                .clipped()
            // Places the title and description vertically.
            VStack(alignment: .leading, spacing: 8) {
                // Displays the Business Profile title.
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                // Displays the Business Profile description.
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.75))
            }
            // Adds spacing around the text content.
            .padding(16)
        }
        // Displays the metallic card background.
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
        // Rounds the corners of the card.
        .clipShape(RoundedRectangle(cornerRadius: 18))
        // Adds a metallic orange border around the card.
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    ECAITheme.orangeMetal.opacity(0.80),
                    lineWidth: 1.4
                )
        )
        // Adds a subtle orange glow.
        .shadow(
            color: Color.orange.opacity(0.18),
            radius: 8
        )
    }
}

// Displays the BusinessCardView inside Xcode previews.
#Preview {
    // Creates a preview of the reusable Business Profile card.
    BusinessCardView(
        imageName: "ECAI_ProjectCommand_V1",
        title: "Project Management",
        description: "Track every project from estimate to completion."
    )
}
