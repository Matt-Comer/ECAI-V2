//
//  DashboardView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
// Displays the main dashboard screen for E.C.A.I.
struct DashboardView: View {
    // Stores the current dashboard business numbers.
    @State private var monthlyRevenue: Double = 0
    @State private var displayedRevenue: Double = 0
    @State private var activeJobs = 0
    @State private var customerCount = 0
    @State private var estimateCount = 0
    // Controls the dashboard entrance animation.
    @State private var showHeader = false
    @State private var showHero = false
    @State private var showRevenue = false
    @State private var showStatistics = false
// Creates the metallic gold border gradient.
    private var borderGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.84, blue: 0.38),
                Color(red: 0.83, green: 0.69, blue: 0.22),
                Color(red: 0.55, green: 0.40, blue: 0.08)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
// Creates the metallic gold title gradient.
    private var titleGradient: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 1.00, green: 0.88, blue: 0.45),
                Color(red: 0.83, green: 0.69, blue: 0.22),
                Color(red: 0.67, green: 0.49, blue: 0.10)
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
                // Arranges every dashboard section vertically.
                VStack(alignment: .leading, spacing: 20) {
                    // Displays the E.C.A.I. branding header.
                    brandHeader
                        .opacity(showHeader ? 1 : 0)
                        .offset(y: showHeader ? 0 : -18)
                    // Displays the Business Command Center artwork.
                    heroCard
                        .opacity(showHero ? 1 : 0)
                        .offset(y: showHero ? 0 : 22)
                    // Displays the current monthly revenue.
                    revenueCard
                        .opacity(showRevenue ? 1 : 0)
                        .offset(y: showRevenue ? 0 : 22)
                // Displays the current business statistics.
                    statisticsGrid
                        .opacity(showStatistics ? 1 : 0)
                        .offset(y: showStatistics ? 0 : 24)
                }
                // Adds spacing around the dashboard.
                .padding()
                // Keeps the final statistic above the tab bar.
                .padding(.bottom, 30)
            }
        }
        // Loads the real saved business numbers when the Dashboard appears.
        .onAppear {
            loadMonthlyRevenue()
            loadCustomerCount()
            loadActiveJobs()
            loadEstimateCount()
            runDashboardAnimation()
        }
    }
    // Creates the E.C.A.I. branding header.
    private var brandHeader: some View {
        ZStack(alignment: .topLeading) {
            // Creates the dark header background.
            RoundedRectangle(cornerRadius: 22)
                .fill(Color(red: 0.055, green: 0.045, blue: 0.045))
            // Adds the metallic gold header border.
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
                    .shadow(color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.55), radius: 8)
                Text("B.C.C.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .tracking(1.4)
                    .foregroundStyle(
                        Color(red: 0.83, green: 0.69, blue: 0.22)
                    )
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal, 115)
        }
        .frame(height: 135)
        .shadow(color: .black.opacity(0.55), radius: 12, x: 0, y: 6)
        .shadow(color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.30), radius: 12)
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
            // Displays the Business Command Center artwork.
            Image("ECAI_CommandCenter_V1")
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .frame(maxWidth: .infinity)
                .clipped()
            // Darkens the artwork behind its text.
            LinearGradient(
                colors: [
                    Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.04),
                    Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.16),
                    .black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            // Displays the artwork title and description.
            VStack(alignment: .leading, spacing: 4) {
                Text("BUSINESS COMMAND CENTER")
                    .font(.headline)
                    .fontWeight(.black)
                    .foregroundStyle(Color(red: 0.83, green: 0.69, blue: 0.22))
                Text("Revenue, AI, company information, and settings.")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.82))
            }
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay {
            // Adds the metallic gold artwork border.
            RoundedRectangle(cornerRadius: 22)
                .stroke(borderGradient, lineWidth: 2)
        }
        .shadow(color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.25), radius: 10)
    }
    // Creates the monthly revenue summary card.
    private var revenueCard: some View {
        // Arranges the revenue information vertically.
        VStack(alignment: .leading, spacing: 6) {
            // Displays the revenue heading.
            Text("Monthly Revenue")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.82))
            // Displays the current monthly revenue amount.
            Text(
                displayedRevenue.formatted(
                    .currency(code: "CAD")
                    .precision(.fractionLength(0))
                )
            )
                .font(.system(size: 38, weight: .black))
                .foregroundStyle(titleGradient)
                .shadow(color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.35), radius: 6)
                .contentTransition(.numericText())
            // Displays the dashboard summary description.
            Text("Track active work, quotes, customers, and future growth.")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.72))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 18)
        .padding(.vertical, 14)
        .background(cardGradient)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay {
            // Adds the metallic gold revenue-card border.
            RoundedRectangle(cornerRadius: 15)
                .stroke(borderGradient, lineWidth: 1.5)
        }
        .shadow(color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.20), radius: 8)
    }
    // Creates the dashboard statistics.
    private var statisticsGrid: some View {
        // Arranges the statistic cards vertically.
        VStack(spacing: 10) {
            // Displays the number of active jobs.
            dashboardStatCard(
                title: "Active Jobs",
                value: "\(activeJobs)",
                icon: "hammer.fill"
            )
            // Displays the number of customers.
            dashboardStatCard(
                title: "Customers",
                value: "\(customerCount)",
                icon: "person.2.fill"
            )
        // Displays the number of estimates.
            dashboardStatCard(
                title: "Estimates",
                value: "\(estimateCount)",
                icon: "doc.text.fill"
            )
            // Displays the number of customer follow-ups.
            dashboardStatCard(
                title: "Follow-Ups",
                value: "0",
                icon: "arrow.triangle.2.circlepath"
            )
        }
    }
    // Creates one slim dashboard statistic card.
    private func dashboardStatCard(
        title: String,
        value: String,
        icon: String
    ) -> some View {
        // Places the icon, title, and value on one row.
        HStack(spacing: 14) {
            // Displays the statistic icon.
            Image(systemName: icon)
                .font(.system(size: 19, weight: .bold))
                .foregroundStyle(Color(red: 0.83, green: 0.69, blue: 0.22))
                .frame(width: 38, height: 38)
                .background(Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.10))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            // Displays the statistic title.
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white.opacity(0.88))
            // Pushes the statistic value to the right.
            Spacer()
            // Displays the current statistic value.
            Text(value)
                .font(.system(size: 28, weight: .black))
                .foregroundStyle(titleGradient)
        }
    // Adds compact spacing inside the statistic card.
        .padding(.horizontal, 16)
        .padding(.vertical, 11)
        // Creates the dark statistic-card background.
        .background(cardGradient)
        // Creates the slimmer rounded card shape.
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay {
            // Adds the metallic gold statistic-card border.
            RoundedRectangle(cornerRadius: 14)
                .stroke(borderGradient, lineWidth: 1.4)
        }
        // Adds a subtle gold glow around the statistic card.
        .shadow(color: Color(red: 0.83, green: 0.69, blue: 0.22).opacity(0.16), radius: 6)
    }
    // Runs the dashboard entrance and revenue animations.
    private func runDashboardAnimation() {
        displayedRevenue = 0
        showHeader = false
        showHero = false
        showRevenue = false
        showStatistics = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.20) {
            withAnimation(.easeOut(duration: 0.50)) {
                showHeader = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
            withAnimation(.spring(response: 0.55, dampingFraction: 0.72)) {
                showHero = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.90) {
            withAnimation(.spring(response: 0.55, dampingFraction: 0.72)) {
                showRevenue = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.10) {
            withAnimation(.easeOut(duration: 1.20)) {
                displayedRevenue = monthlyRevenue
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.30) {
            withAnimation(.spring(response: 0.60, dampingFraction: 0.72)) {
                showStatistics = true
            }
        }
    }
    // Loads the real approved quote value for the dashboard.
    private func loadMonthlyRevenue() {
        if let data = UserDefaults.standard.data(forKey: "ECAIQuotes"),
           let savedQuotes = try? JSONDecoder().decode([Quote].self, from: data) {
            monthlyRevenue = savedQuotes
                .filter { $0.status == "Approved" }
                .reduce(0) { $0 + $1.amount }
        } else {
            monthlyRevenue = 0
        }
    }
    // Loads the real saved customer count for the dashboard.
    private func loadCustomerCount() {
        if let data = UserDefaults.standard.data(forKey: "ECAICustomers"),
           let savedCustomers = try? JSONDecoder().decode([Customer].self, from: data) {
            customerCount = savedCustomers.count
        } else {
            customerCount = 0
        }
    }
    // Loads the real saved active-job count for the dashboard.
    private func loadActiveJobs() {
        if let data = UserDefaults.standard.data(forKey: "ECAIJobs"),
           let savedJobs = try? JSONDecoder().decode([Job].self, from: data) {
            activeJobs = savedJobs.filter { $0.status != "Completed" }.count
        } else {
            activeJobs = 0
        }
    }
    // Loads the real saved estimate count for the dashboard.
    private func loadEstimateCount() {
        if let data = UserDefaults.standard.data(forKey: "ECAIQuotes"),
           let savedQuotes = try? JSONDecoder().decode([Quote].self, from: data) {
            estimateCount = savedQuotes.count
        } else {
            estimateCount = 0
        }
    }
}
// Displays the dashboard inside Xcode.
#Preview {
    DashboardView()
}
