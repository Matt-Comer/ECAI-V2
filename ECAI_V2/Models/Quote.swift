//
//  Quote.swift
//  ECAI_V1
//
//  Created by Matthew Comer on 2026-06-29.
//
import Foundation
// Creates the model used to store one quote.
struct Quote: Identifiable {
    // Creates a unique identifier for each quote.
    let id = UUID()
    // Stores the customer name for the quote.
    var customerName: String
    // Stores the total quote amount.
    var amount: Double
    // Stores the current quote status.
    var status: String
}
