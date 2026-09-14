
//
//  DashboardView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
// Displays the main dashboard screen for E.C.A.I.
struct DashboardView: View {
    // Creates the metallic orange border gradient.
    private var borderGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.62, blue: 0.12),
                .orange,
                Color(red: 0.72, green: 0.28, blue: 0.02)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    // Creates the metallic orange title gradient.
    private var titleGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.70, blue: 0.18),
                .orange,
                Color(red: 1.00, green: 0.38, blue: 0.02)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    // Creates the premium dark card gradient.
    private var cardGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 0.10, green: 0.075, blue: 0.055),
                Color(red: 0.065, green: 0.055, blue: 0.055)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    // Displays the complete dashboard interface.
    var body: some View {
        ZStack {
            // Displays the black application background.
            Color.black
                .ignoresSafeArea()
            // Allows the dashboard to scroll vertically.
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    brandHeader
                    heroCard
                    revenueCard
                    statisticsGrid
                }
                .padding()
                .padding(.bottom, 30)
            }
        }
    }
    // Creates the E.C.A.I. branding header.
    private var brandHeader: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 22)
                .fill(Color(red: 0.055, green: 0.045, blue: 0.045))
            RoundedRectangle(cornerRadius: 22)
                .stroke(borderGradient, lineWidth: 2)
            // Displays the official E.C.A.I. logo.
            Image("ECAI-Logo-#1")
                .resizable()
                .scaledToFit()
                .frame(width: 78, height: 78)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.leading, 16)
                .padding(.top, 14)
            // Displays the social-media icons.
            HStack(spacing: 5) {
                socialIcon("facebook", size: 31)
                socialIcon("LinkedInIcon", size: 31)
                socialIcon("x", size: 26)
            }
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            .padding(.top, 22)
            .padding(.trailing, 18)
            // Displays the centered title and initials.
            VStack(spacing: 5) {
                Text("E.C.A.I.")
                    .font(.system(size: 34, weight: .black))
                    .foregroundStyle(titleGradient)
                    .shadow(color: .orange.opacity(0.55), radius: 8)
                Text("B.C.C.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .tracking(1.4)
                    .foregroundStyle(
                        Color(red: 0.95, green: 0.67, blue: 0.20)
                    )
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal, 115)
        }
        .frame(height: 135)
        .shadow(color: .black.opacity(0.55), radius: 12, x: 0, y: 6)
        .shadow(color: .orange.opacity(0.30), radius: 12)
    }
    // Creates one social-media image.
    private func socialIcon(_ name: String, size: CGFloat) -> some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }
    // Creates the business intelligence artwork card.
    private var heroCard: some View {
        ZStack(alignment: .bottomLeading) {
            Image("ECAI_CommandCenter_V1")
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .frame(maxWidth: .infinity)
                .clipped()
            // Darkens the artwork behind its text.
            LinearGradient(
                colors: [
                    .orange.opacity(0.04),
                    .orange.opacity(0.16),
                    .black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            VStack(alignment: .leading, spacing: 4) {
                Text("BUSINESS COMMAND CENTER")
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundStyle(.orange)
                Text("Revenue, AI, company information, and settings.")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.82))
            }
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay {
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.orange.opacity(0.90), lineWidth: 2)
        }
        .shadow(color: .orange.opacity(0.25), radius: 10)
    }
    // Creates the monthly revenue summary card.
    private var revenueCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Monthly Revenue")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.82))
            Text("$8,450")
                .font(.system(size: 42, weight: .black))
                .foregroundStyle(titleGradient)
                .shadow(color: .orange.opacity(0.35), radius: 6)
            Text("Track active work, quotes, customers, and future growth.")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.72))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(cardGradient)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay {
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.orange.opacity(0.90), lineWidth: 2)
        }
        .shadow(color: .orange.opacity(0.25), radius: 10)
    }
    // Creates the two-column statistics grid.
    private var statisticsGrid: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ],
            spacing: 14
        ) {
            DashboardCard(title: "Active Jobs", value: "3")
            DashboardCard(title: "Customers", value: "12")
            DashboardCard(title: "Estimates", value: "7")
            DashboardCard(title: "Follow-Ups", value: "4")
        }
    }
}
// Displays the dashboard inside Xcode.
#Preview {
    DashboardView()
}
