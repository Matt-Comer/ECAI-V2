
//
//  RevenueView.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
// Displays the Revenue screen for Elite Contractor AI.
struct RevenueView: View {
    // Stores the total value of approved quotes.
    @State private var approvedRevenue: Double = 0
    // Stores the total value of quotes still waiting for approval.
    @State private var pendingRevenue: Double = 0
    // Stores the total projected revenue.
    @State private var projectedRevenue: Double = 0
    // Creates the metallic gold gradient.
    private var goldGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.88, blue: 0.45),
                Color(red: 0.83, green: 0.69, blue: 0.22),
                Color(red: 0.67, green: 0.49, blue: 0.10)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    // Displays the Revenue screen interface.
    var body: some View {
// Creates the navigation system for the Revenue screen.
        NavigationStack {
            // Places the background behind the Revenue content.
            ZStack {
        // Displays the black application background.
                Color.black
                    .ignoresSafeArea()
            // Places every Revenue section vertically.
                VStack(alignment: .leading, spacing: 22) {
                    // Displays the main screen title.
                    ECAIMetallicTitle(text: "REVENUE")
                // Displays the approved revenue summary card.
                    VStack(alignment: .leading, spacing: 10) {
                        // Displays the revenue heading.
                        Text("Approved Revenue")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.75))
                    // Displays the total approved revenue.
                        Text(formatCurrency(approvedRevenue))
                            .font(.system(size: 44, weight: .black))
                            .foregroundStyle(goldGradient)
                            .shadow(
                                color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.35),
                                radius: 6
                            )
                        // Displays a short description.
                        Text("Current value of approved customer quotes.")
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.70))
                    }
                    // Allows the revenue card to fill the available width.
                    .frame(maxWidth: .infinity, alignment: .leading)
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
                        RoundedRectangle(cornerRadius: 18)
                    )
                    // Adds the metallic gold border.
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(
                                goldGradient,
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
                        color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.20),
                        radius: 8
                    )
                    // Displays the Approved Quotes card.
                    RevenueCard(
                        title: "Approved Quotes",
                        value: formatCurrency(approvedRevenue)
                    )
                    // Displays the Pending Quotes card.
                    RevenueCard(
                        title: "Pending Quotes",
                        value: formatCurrency(pendingRevenue)
                    )
                    // Displays the Projected Revenue card.
                    RevenueCard(
                        title: "Projected Revenue",
                        value: formatCurrency(projectedRevenue)
                    )
                    // Pushes the Revenue content toward the top.
                    Spacer()
                }
                // Adds spacing around the Revenue screen.
                .padding()
            }
            // Loads the saved quote totals when the Revenue screen opens.
            .onAppear {
                loadRevenue()
            }
        }
    }
    // Loads saved quotes and calculates the revenue totals.
    private func loadRevenue() {
        // Gets the saved quote data from the device.
        guard let data = UserDefaults.standard.data(forKey: "ECAIQuotes"),
              let savedQuotes = try? JSONDecoder().decode([Quote].self, from: data) else {
            approvedRevenue = 0
            pendingRevenue = 0
            projectedRevenue = 0
            return
        }
        // Adds together every approved quote.
        approvedRevenue = savedQuotes
            .filter { $0.status == "Approved" }
            .reduce(0) { $0 + $1.amount }
        // Adds together every sent or draft quote.
        pendingRevenue = savedQuotes
            .filter { $0.status == "Sent" || $0.status == "Draft" }
            .reduce(0) { $0 + $1.amount }
        // Combines approved and pending quotes for projected revenue.
        projectedRevenue = approvedRevenue + pendingRevenue
    }
    // Formats revenue values as Canadian currency.
    private func formatCurrency(_ amount: Double) -> String {
        amount.formatted(
            .currency(code: "CAD")
            .precision(.fractionLength(0))
        )
    }
}
// Creates one reusable revenue information card.
struct RevenueCard: View {
    // Stores the revenue card title.
    let title: String
    // Stores the revenue value.
    let value: String
    // Creates the metallic gold gradient.
    private var goldGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.88, blue: 0.45),
                Color(red: 0.83, green: 0.69, blue: 0.22),
                Color(red: 0.67, green: 0.49, blue: 0.10)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    // Displays the Revenue card.
    var body: some View {
        // Places the revenue information vertically.
        VStack(alignment: .leading, spacing: 8) {
            // Displays the revenue card title.
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.70))
            // Displays the revenue value.
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(goldGradient)
        }
        // Allows the card to fill the available width.
        .frame(maxWidth: .infinity, alignment: .leading)
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
            RoundedRectangle(cornerRadius: 18)
        )
        // Adds the metallic gold border.
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    goldGradient,
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
            color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.20),
            radius: 8
        )
    }
}
// Displays the Revenue screen inside Xcode.
#Preview {
    // Creates a preview of the Revenue screen.
    RevenueView()
}
