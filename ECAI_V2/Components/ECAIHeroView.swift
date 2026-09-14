
//
//   ECAIHeroView.swift
//  ECAI_V2
//
//  Created by  Matthew Comer on 2026-07-10.
//
import SwiftUI
// Creates one  reusable hero image for the main E.C.A.I. screens.
struct ECAIHeroView: View {
// Stores the asset name displayed inside the hero.
    let imageName: String
// Stores the main title displayed over the image.
    let title: String
    // Stores the smaller  description displayed below the title.
    let subtitle: String
    // Displays the professional E.C.A.I. page header and hero section.
    var body: some View {
        // Places the page header and hero image vertically.
        VStack(alignment: .leading, spacing: 0) {
        // Displays the selected E.C.A.I. artwork.
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 165)
                .frame(maxWidth: .infinity)
                .clipped()
            //  Adds a dark orange fade below the artwork.
            LinearGradient(
                colors: [
                    Color.clear,
                    Color.orange.opacity(0.12),
                    Color.black.opacity(0.94)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            // Displays  the hero title and description.
            VStack(alignment: .leading, spacing: 5) {
                // Displays the hero title.
                ECAIMetallicTitle(
                    text: title.uppercased(),
                    size: 25
                )
                // Displays the hero description.
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(
                        ECAITheme.silver.opacity(0.92)
                    )
            }
            // Adds spacing around the hero text.
            .padding(16)
        }
        // Clips the hero into rounded corners.
        .clipShape(
            RoundedRectangle(cornerRadius: 22)
        )
        // Adds the E.C.A.I. orange border.
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(
                    Color.orange.opacity(0.92),
                    lineWidth: 2
                )
        )
        // Adds the orange glow around the hero.
        .shadow(
            color: .orange.opacity(0.28),
            radius: 10
        )
    }
}
// Displays the reusable hero inside Xcode.
#Preview {
    // Creates a preview using one E.C.A.I. asset.
    ECAIHeroView(
        imageName: "ECAI-splashscreen-V6",
        title: "E.C.A.I.",
        subtitle: "Business Command Center"
    )
    .padding()
    .background(Color.black)
}
