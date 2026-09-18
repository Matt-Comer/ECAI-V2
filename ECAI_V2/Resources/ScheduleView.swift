//
//  ScheduleView.swift
//  ECAI_V2
//
//  Created by matthew comer on 2026-09-17.
//

import SwiftUI
// Displays scheduled jobs and reminders.
struct ScheduleView: View {
    // Stores the schedule items displayed on the screen.
    @State private var scheduleItems: [ScheduleItem] = [
        ScheduleItem(
            title: "Interior Painting",
            customerName: "Frank",
            jobName: "Interior Painting",
            date: Date(),
            reminderType: "Job",
            isCompleted: false
        ),
        ScheduleItem(
            title: "Concrete Repair Estimate",
            customerName: "Clint",
            jobName: "Concrete Repair",
            date: Date().addingTimeInterval(86400),
            reminderType: "Estimate",
            isCompleted: false
        )
    ]
// Controls the Add Schedule sheet.
    @State private var showingAddSchedule = false
    // Displays the Schedule screen interface.
    var body: some View {
        ZStack {
        // Displays the black application background.
            Color.black
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                // Displays the metallic gold Schedule title.
                    ECAIMetallicTitle(
                        text: "SCHEDULE & REMINDERS",
                        size: 27
                    )
                // Opens the Add Schedule  screen.
                    Button {
                        showingAddSchedule = true
                    } label: {
                        Label("Add Schedule Item", systemImage: "plus.circle.fill")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(ECAITheme.goldMetal)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(ECAITheme.metallicGold, lineWidth: 1.5)
                            )
                            .shadow(
                                color: ECAITheme.metallicGold.opacity(0.22),
                                radius: 8
                            )
                    }
                    // Displays each scheduled  item.
                    ForEach(scheduleItems) { item in
                        VStack(alignment: .leading, spacing: 8) {
                            // Displays the schedule item title.
                            Text(item.title)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            // Displays the customer name.
                            Text("Customer: \(item.customerName)")
                                .foregroundStyle(.white.opacity(0.60))
                            // Displays the scheduled date.
                            Text(item.date, style: .date)
                                .foregroundStyle(.white.opacity(0.60))
                            // Displays the reminder type.
                            Text("Type: \(item.reminderType)")
                                .fontWeight(.medium)
                                .foregroundStyle(ECAITheme.metallicGold)
                        }
                        .padding(18)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(ECAITheme.graphite.opacity(0.96))
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(ECAITheme.goldMetal, lineWidth: 1.5)
                        )
                        .shadow(
                            color: Color.black.opacity(0.45),
                            radius: 12,
                            y: 6
                        )
                        .shadow(
                            color: ECAITheme.metallicGold.opacity(0.18),
                            radius: 8
                        )
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .navigationTitle("Schedule")
        .navigationBarTitleDisplayMode(.inline)
        // Opens the Add Schedule form.
        .sheet(isPresented: $showingAddSchedule) {
            NavigationStack {
                AddScheduleView(scheduleItems: $scheduleItems)
            }
        }
    }
}
// Displays the Schedule screen preview.
#Preview {
    NavigationStack {
        ScheduleView()
    }
}

