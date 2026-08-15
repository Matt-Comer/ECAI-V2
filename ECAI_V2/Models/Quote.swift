//
//  Quote.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//

import Foundation

// Quote model for storing estimate information
struct Quote: Identifiable {

    // Unique ID for each quote
    let id = UUID()

    // Customer name for the quote
    var customerName: String

    // Quote amount
    var amount: Double

    // Current quote status
    var status: String
}
