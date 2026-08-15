//
//  CustomersView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-17.
//
import SwiftUI
// Displays the customer management screen.
struct CustomersView: View {
    // Stores the customers displayed on the screen.
    let customers: [Customer] = [
        Customer(name: "Frank", phone: "416-555-1122", address: "Toronto, ON"),
        Customer(name: "Clint", phone: "416-555-3344", address: "Etobicoke, ON"),
        Customer(name: "Jessica", phone: "416-555-7788", address: "Toronto, ON")
    ]
    // Stores the metallic orange border gradient.
    private let borderGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.62, blue: 0.12),
            .orange,
            Color(red: 0.72, green: 0.28, blue: 0.02)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Stores the metallic orange title gradient.
    private let titleGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.70, blue: 0.18),
            .orange,
            Color(red: 1.00, green: 0.38, blue: 0.02)
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    // Stores the dark customer-card gradient.
    private let cardGradient = LinearGradient(
        colors: [
            Color(red: 0.10, green: 0.075, blue: 0.055),
            Color(red: 0.065, green: 0.055, blue: 0.055)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Builds the complete Customers screen.
    var body: some View {
        // Places the content over the black background.
        ZStack {
            // Displays the application background.
            Color.black
                .ignoresSafeArea()
            // Allows the screen to scroll vertically.
            ScrollView {
                // Arranges every section vertically.
                VStack(alignment: .leading, spacing: 20) {
                    // Displays the branding header.
                    brandHeader
                    // Displays the customer artwork.
                    heroCard
                    // Displays one card for every customer.
                    ForEach(customers) { customer in
                        customerCard(customer: customer)
                    }
                }
                // Adds spacing around the screen.
                .padding()
                // Keeps the final customer above the tab bar.
                .padding(.bottom, 90)
            }
            // Hides the scroll indicator.
            .scrollIndicators(.hidden)
        }
    }
    // Creates the Customers branding header.
    private var brandHeader: some View {
        ZStack(alignment: .topLeading) {
            // Creates the dark header background.
            RoundedRectangle(cornerRadius: 22)
                .fill(Color(red: 0.055, green: 0.045, blue: 0.045))
            // Adds the metallic orange border.
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
                Image("facebook")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 31, height: 31)
                Image("LinkedInIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 31, height: 31)
                Image("x")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
            }
            .frame(maxWidth: .infinity, alignment: .topTrailing)
            .padding(.top, 22)
            .padding(.trailing, 18)
            // Displays the centered title and subtitle.
            VStack(spacing: 5) {
                Text("E.C.A.I.")
                    .font(.system(size: 34, weight: .black))
                    .foregroundStyle(titleGradient)
                    .shadow(color: .orange.opacity(0.55), radius: 8)
                Text("C.C.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white.opacity(0.92))
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal, 115)
        }
        .frame(height: 135)
        .shadow(color: .black.opacity(0.55), radius: 12, x: 0, y: 6)
        .shadow(color: .orange.opacity(0.30), radius: 12)
    }
    // Creates the customer artwork card.
    private var heroCard: some View {
        ZStack(alignment: .bottomLeading) {
            // Displays the complete artwork without cropping faces.
            Image("ECAI-splashscreen-V7")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            // Darkens the artwork behind the text.
            LinearGradient(
                colors: [
                    .orange.opacity(0.04),
                    .orange.opacity(0.16),
                    .black.opacity(0.95)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            // Displays the artwork title and description.
            VStack(alignment: .leading, spacing: 4) {
                Text("CUSTOMERS")
                    .font(.system(size: 28, weight: .black))
                    .foregroundStyle(titleGradient)
                    .shadow(color: .black, radius: 3, x: 0, y: 2)
                Text("Manage your customer database.")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.82))
            }
            .padding(16)
        }
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.orange.opacity(0.90), lineWidth: 2)
        )
        .shadow(color: .orange.opacity(0.25), radius: 10)
    }
    // Creates one customer information card.
    private func customerCard(customer: Customer) -> some View {
        // Arranges the customer information horizontally.
        HStack(spacing: 14) {
            // Displays the customer profile icon.
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 42))
                .foregroundStyle(titleGradient)
                .frame(width: 58, height: 58)
                .background(Color.black.opacity(0.45))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            // Displays the customer's contact information.
            VStack(alignment: .leading, spacing: 6) {
                Text(customer.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Label(customer.phone, systemImage: "phone.fill")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.75))
                Label(customer.address, systemImage: "mappin.circle.fill")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.75))
            }
            // Pushes the chevron to the right.
            Spacer()
            // Displays the navigation chevron.
            Image(systemName: "chevron.right")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.orange)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(cardGradient)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.orange.opacity(0.90), lineWidth: 2)
        )
        .shadow(color: .orange.opacity(0.25), radius: 10)
    }
}
// Displays the Customers screen inside Xcode.
#Preview {
    CustomersView()
}
