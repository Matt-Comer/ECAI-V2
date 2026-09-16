//
//  Job.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//
import Foundation
// Job model for storing job information
struct Job: Identifiable, Codable {
// Unique ID for each job
    var id = UUID()
// Customer name
    var customerName: String
// Type of work being completed
    var jobType: String
// Current job status
    var status: String
}
