//
//  ScheduleItem.swift
//  ECAI_V2
//
//  Created by matthew comer on 2026-09-17.
//
import Foundation
// Stores information for one scheduled job or reminder
struct ScheduleItem: Identifiable {
    // Stores the unique identifier for the schedule item.
    let id = UUID()
    // Stores the schedule item title.
    var title: String
    // Stores the customer connected to the schedule item.
    var customerName: String
    // Stores the job connected to the schedule item.
    var jobName: String
    // Stores the scheduled date and time.
    var date: Date
    // Stores the type of reminder.
    var reminderType: String    
    // Tracks whether the schedule item is completed.
    var isCompleted: Bool
}
