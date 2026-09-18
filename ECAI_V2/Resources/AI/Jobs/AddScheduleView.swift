//
//  AddScheduleView.swift
//  ECAI_V2
//
//  Created by matthew comer on 2026-09-17.
//

import SwiftUI
// Displays the form used to create a new schedule item.
struct AddScheduleView: View {
    // Connects this view to the schedule items stored in ScheduleView.
    @Binding var scheduleItems: [ScheduleItem]
    // Allows the screen to close after saving or cancelling.
    @Environment(\.dismiss) private var dismiss
    // Stores the schedule title entered by the user.
    @State private var title = ""
    // Stores the customer name entered by the user.
    @State private var customerName = ""
    // Stores the job name entered by the user.
    @State private var jobName = ""
    // Stores the selected schedule date and time.
    @State private var date = Date()
    // Stores the selected reminder type.
    @State private var reminderType = "Job"
    // Provides the reminder choices displayed in the picker.
    private let reminderTypes = [
        "Job",
        "Estimate",
        "Appointment",
        "Follow Up"
    ]
    // Displays the Add Schedule screen.
    var body: some View {
        ZStack {
            // Creates the black ECAI background.
            Color.black
                .ignoresSafeArea()
            // Allows the form to scroll on smaller screens.
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Displays the metallic gold screen title.
                    ECAIMetallicTitle(
                        text: "ADD SCHEDULE ITEM",
                        size: 27
                    )
                    // Allows the user to enter the schedule title.
                    TextField("Schedule Title", text: $title)
                        .textFieldStyle(.roundedBorder)
                    // Allows the user to enter the customer name.
                    TextField("Customer Name", text: $customerName)
                        .textFieldStyle(.roundedBorder)
                    // Allows the user to enter the job name.
                    TextField("Job Name", text: $jobName)
                        .textFieldStyle(.roundedBorder)
                // Allows the user to select the schedule date and time.
                    DatePicker(
                        "Date & Time",
                        selection: $date,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    .foregroundStyle(.white)
                    .colorScheme(.dark)
                    .tint(ECAITheme.metallicGold)
                    // Allows the user to select the  reminder type.
                    Picker("Reminder Type", selection: $reminderType) {
                        ForEach(reminderTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(ECAITheme.metallicGold)
                // Saves the information entered into the schedule.
                    Button {
                        addScheduleItem()
                    } label: {
                        Text("ADD TO SCHEDULE")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(ECAITheme.goldMetal)
                            .foregroundStyle(.black)
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
                }
                .padding()
            }
        }
        // Adds the gold Cancel button.
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Cancel") {
                    dismiss()
                }
                .foregroundStyle(ECAITheme.metallicGold)
            }
        }
    }
    // Creates and saves a new schedule  item.
    private func addScheduleItem() {
        // Creates the new item using the form information.
        let newItem = ScheduleItem(
            title: title,
            customerName: customerName,
            jobName: jobName,
            date: date,
            reminderType: reminderType,
            isCompleted: false
        )
    // Adds  the new item to the ScheduleView array.
        scheduleItems.append(newItem)
    // Clears the form after the item has been saved.
        title = ""
        customerName = ""
        jobName = ""
        date = Date()
        reminderType = "Job"
    // Returns the user directly to the Schedule  screen.
        dismiss()
    }
}
