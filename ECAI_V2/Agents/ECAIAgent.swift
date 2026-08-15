//
//  ECAIAgent.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-10.
//
import Foundation
// Defines the common behavior for every E.C.A.I. intelligence agent.
protocol ECAIAgent {
    // Stores the display name of the agent.
    var name: String { get }
    // Stores a short description of the agent.
    var description: String { get }
    // Generates a response from the user's input.
    func generateResponse(
        from input: String
    ) -> String
}
