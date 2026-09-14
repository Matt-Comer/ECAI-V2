
//
//  JobsView.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-06-29.
//
import SwiftUI
// Displays the job management screen.
struct JobsView: View {
    // Stores the sample jobs displayed on the screen.
    let jobs = [
        Job(customerName: "Frank", jobType: "Interior Painting", status: "Scheduled"),
        Job(customerName: "Clint", jobType: "Vehicle Wrap Prep", status: "In Progress"),
        Job(customerName: "Jessica", jobType: "Concrete Repair", status: "Completed")
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
    // Stores the metallic gold job-card border.
    private let goldGradient = LinearGradient(
        colors: [
            Color(red: 1.00, green: 0.92, blue: 0.60),
            Color(red: 0.82, green: 0.64, blue: 0.20),
            Color(red: 1.00, green: 0.96, blue: 0.72)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    // Displays the complete Jobs screen.
    var body: some View {
        // Creates the navigation system for the screen.
        NavigationStack {
            // Places the content over the black background.
            ZStack {
                // Displays the application background.
                Color.black
                    .ignoresSafeArea()
                // Allows the job list to scroll vertically.
                ScrollView {
                    // Arranges every Jobs section vertically.
                    VStack(alignment: .leading, spacing: 22) {
                        // Displays the Jobs branding header.
                        brandHeader
                        // Displays the Jobs artwork.
                        heroCard
                        // Displays the current-jobs heading and count.
                        HStack {
                            Text("Custom.")
                                .font(.headline)
                                .foregroundStyle(.orange)
                            Spacer()
                            Text("\(jobs.count) Jobs.")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.70))
                        }
                        // Displays one card for every job.
                        ForEach(jobs) { job in
                            jobCard(job: job)
                        }
                        // Pushes the job content toward the top.
                        Spacer()
                    }
                    // Adds spacing around the Jobs screen.
                    .padding(.horizontal, 16)
                    // Adds compact spacing above the header.
                    .padding(.top, 12)
                    // Keeps the final card above the tab bar.
                    .padding(.bottom, 120)
                }
            }
        }
    }
    // Creates the Jobs branding header.
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
                Text("J.C.")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(titleGradient)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 50)
            .padding(.horizontal, 115)
        }
        .frame(height: 135)
        .shadow(color: .black.opacity(0.55), radius: 12, x: 0, y: 6)
        .shadow(color: .orange.opacity(0.30), radius: 12)
    }
    // Creates the Jobs artwork card.
    private var heroCard: some View {
        ZStack(alignment: .bottomLeading) {
            // Displays the complete Jobs artwork.
            Image("ECAI-splashscreen-V8")
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
            // Displays the artwork heading and description.
            VStack(alignment: .leading, spacing: 4) {
                Text("PROJECT OPERATIONS")
                    .font(.system(size: 28, weight: .black))
                    .foregroundStyle(titleGradient)
                    .shadow(color: .black, radius: 3, x: 0, y: 2)
                Text("Track active work, crews, and job progress.")
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
    // Creates one job information card.
    private func jobCard(job: Job) -> some View {
        // Places the job information vertically.
        VStack(alignment: .leading, spacing: 12) {
            // Displays the type of work.
            Text(job.jobType)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            // Displays the assigned customer.
            HStack(spacing: 10) {
                Image(systemName: "person.fill")
                    .foregroundStyle(.orange)
                Text(job.customerName)
                    .foregroundStyle(.white.opacity(0.85))
            }
            // Displays the current job status.
            HStack(spacing: 10) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.orange)
                Text(job.status)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white.opacity(0.85))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(Color(red: 0.08, green: 0.08, blue: 0.09))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(goldGradient, lineWidth: 1.4)
        )
        .shadow(color: .black.opacity(0.45), radius: 12, x: 0, y: 6)
        .shadow(color: Color.yellow.opacity(0.16), radius: 8)
    }
}
// Displays the Jobs screen inside Xcode.
#Preview {
    JobsView()
}
