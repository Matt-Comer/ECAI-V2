//
//  Customer.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-06-29.
//
import Foundation
// Creates the model used to store one customer's information.
struct Customer: Identifiable, Codable {
    // Creates a unique identifier so SwiftUI can recognize each customer.
    var id = UUID()
    // Stores the customer's full name.
    var name: String
    // Stores the customer's phone number.
    var phone: String
    // Stores the customer's address or job location.
    var address: String
}
