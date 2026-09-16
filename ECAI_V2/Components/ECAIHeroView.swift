
//
//   ECAIHeroView.swift
//  ECAI_V2
//
//  Created by  Matthew Comer on 2026-07-10.
////
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
                    Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.12),
                    Color.black.opacity(0.94)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            // Displays  the hero title and description.
            VStack(alignment: .leading, spacing: 5) {
                // Displays the hero title.
                if title.uppercased() == "COMMAND CENTER" {
                    Text(title.uppercased())
                        .font(.system(size: 25, weight: .black))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(red: 1.00, green: 0.88, blue: 0.45),
                                    Color(red: 0.83, green: 0.69, blue: 0.22),
                                    Color(red: 0.67, green: 0.49, blue: 0.10)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                } else if title.uppercased() == "BUSINESS TOOLS" {
                    Text(title.uppercased())
                        .font(.system(size: 25, weight: .black))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(red: 1.00, green: 0.88, blue: 0.45),
                                    Color(red: 0.83, green: 0.69, blue: 0.22),
                                    Color(red: 1.00, green: 0.32, blue: 0.05),
                                    Color(red: 0.83, green: 0.69, blue: 0.22),
                                    Color(red: 1.00, green: 0.88, blue: 0.45),
                                    Color(red: 0.83, green: 0.69, blue: 0.22),
                                    Color(red: 1.00, green: 0.32, blue: 0.05),
                                    Color(red: 0.83, green: 0.69, blue: 0.22),
                                    Color(red: 1.00, green: 0.88, blue: 0.45)
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .shadow(
                            color: Color(red: 1.00, green: 0.30, blue: 0.04).opacity(0.22),
                            radius: 1.5
                        )
                } else {
                    ECAIMetallicTitle(
                        text: title.uppercased(),
                        size: 25
                    )
                }
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
                    LinearGradient(
                        colors: [
                            Color(red: 1.00, green: 0.84, blue: 0.38),
                            Color(red: 0.83, green: 0.69, blue: 0.22),
                            Color(red: 0.55, green: 0.40, blue: 0.08)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                )
        )
        // Adds the orange glow around the hero.
        .shadow(
            color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.28),
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
