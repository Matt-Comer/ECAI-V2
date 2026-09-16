//
//  ECAIDesignSystem.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-14.
//
import SwiftUI
// Stores the locked Elite Contractor AI colour system used throughout the application.
enum ECAITheme {
    // Stores the brightest metallic orange highlight colour.
    static let metallicOrangeTop = Color(red: 1.00, green: 0.48, blue: 0.12)
    // Stores the primary metallic orange brand colour.
    static let metallicOrange = Color(red: 0.95, green: 0.30, blue: 0.05)
// Stores the darkest metallic orange shadow colour.
    static let metallicOrangeBottom = Color(red: 0.55, green: 0.12, blue: 0.02)
    // Stores  the brushed silver accent colour.
    static let silver = Color(red: 0.79, green: 0.82, blue: 0.86)
    // Stores  the matte graphite background colour.
    static let graphite = Color(red: 0.07, green: 0.07, blue: 0.08)
    // Creates the official metallic orange gradient  used across the application.
    static let orangeMetal = LinearGradient(
        colors: [metallicOrangeTop, metallicOrange, metallicOrangeBottom],
        startPoint: .top,
        endPoint: .bottom
    )
}
// Displays  reusable metallic orange title text with a solid black outline.
struct ECAIMetallicTitle: View {
    // Stores the text  displayed inside the title.
    let text: String
    // Stores the  font size used by the title.
    var size: CGFloat = 32
// Stores the alignment used by the title.
    var alignment: TextAlignment = .leading
    // Stores the thickness of the black outline.
    private let outlineWidth: CGFloat = 1.6
    // Displays the metallic title interface.
    var body: some View {
        // Layers multiple copies of the text together.
        ZStack {
        // Displays the left outline.
            outlinedCopy(x: -outlineWidth, y: 0)
            // Displays the right outline.
            outlinedCopy(x: outlineWidth, y: 0)
        // Displays the top outline.
            outlinedCopy(x: 0, y: -outlineWidth)
            // Displays the  bottom outline.
            outlinedCopy(x: 0, y: outlineWidth)
            // Displays the upper left outline.
            outlinedCopy(x: -outlineWidth, y: -outlineWidth)
            // Displays the upper right outline.
            outlinedCopy(x: outlineWidth, y: -outlineWidth)
            // Displays the lower left outline.
            outlinedCopy(x: -outlineWidth, y: outlineWidth)
            // Displays the lower right outline.
            outlinedCopy(x: outlineWidth, y: outlineWidth)
            // Displays the finished metallic title.
            baseText
                .foregroundStyle(ECAITheme.orangeMetal)
                .shadow(color: ECAITheme.metallicOrange.opacity(0.45), radius: 8)
        }
        //  Combines every layer into one accessibility element.
        .accessibilityElement(children: .ignore)
        // Uses the displayed title as the accessibility label.
        .accessibilityLabel(text)
    }
    // Creates the main title  text used throughout the application.
    private var baseText: some View {
        // Displays the supplied title text.
        Text(text)
            // Applies the official ECAI title font.
            .font(.system(size: size, weight: .black, design: .rounded))
            // Adds spacing between each character.
            .tracking(0.8)
            // Applies the selected text alignment.
            .multilineTextAlignment(alignment)
    }
    // Creates one black  outline copy of the title.
    private func outlinedCopy(x: CGFloat, y: CGFloat) -> some View {
        // Displays one outlined copy of the title.
        baseText
            // Applies the outline colour.
            .foregroundStyle(Color.black)
            // Moves the outline into position.
            .offset(x: x, y: y)
    }
}
// Displays the reusable Elite Contractor AI brand header.
struct ECAIBrandHeader: View {
    // Stores the title displayed inside the brand header.
    let title: String
    // Stores the subtitle displayed below the title.
    let subtitle: String
    // Displays the complete brand header interface.
    var body: some View {
        // Places the logo and text beside each other.
        HStack(spacing: 14) {
        // Displays the official ECAI logo.
            Image("ECAI-Logo-#1")
            // Allows the logo image to resize.
                .resizable()
            // Keeps the complete logo visible.
                .scaledToFit()
                // Sets the displayed logo size.
                .frame(width: 72, height: 72)
                // Adds a matte black background behind the logo.
                .background(Color.black.opacity(0.90))
                // Rounds the corners around the logo.
                .clipShape(RoundedRectangle(cornerRadius: 16))
                // Adds the official metallic border.
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(ECAITheme.orangeMetal, lineWidth: 2)
                )
                // Adds a metallic glow around the logo.
                .shadow(color: ECAITheme.metallicOrange.opacity(0.35), radius: 10)
            // Places the title and subtitle vertically.
            VStack(alignment: .center, spacing: 4) {
                // Displays the official metallic title.
                ECAIMetallicTitle(
                    text: title.uppercased(),
                    size: 27,
                    alignment: .center
                )
                // Limits the title to two lines.
                .lineLimit(2)
                // Allows the title to shrink when needed.
                .minimumScaleFactor(0.68)
                // Displays the initials below the title.
                Text(subtitle)
                    // Applies the subtitle font.
                    .font(.subheadline.weight(.bold))
                    // Adds spacing between the initials.
                    .tracking(1.4)
                    // Applies the gold orange colour.
                    .foregroundStyle(
                        Color(red: 0.83, green: 0.69, blue: 0.22)
                    )
                    // Centers the initials below the title.
                    .frame(maxWidth: .infinity, alignment: .center)
            }            // Pushes the content to the leading side.
            Spacer(minLength: 0)
        }
        // Adds spacing around the complete header.
        .padding(16)
        // Displays the graphite background.
        .background(
            RoundedRectangle(cornerRadius: 22)
                .fill(ECAITheme.graphite.opacity(0.96))
        )
        // Adds the official metallic border.
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(ECAITheme.orangeMetal, lineWidth: 2)
        )
        // Adds the black shadow behind the header.
        .shadow(color: Color.black.opacity(0.60), radius: 12, y: 6)
        // Adds the metallic orange glow.
        .shadow(color: ECAITheme.metallicOrange.opacity(0.22), radius: 10)
    }
}
