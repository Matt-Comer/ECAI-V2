
//  IntelligenceEngine.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-10.
//
import Foundation
// Controls every E.C.A.I. intelligence agent.
final class IntelligenceEngine {
    // Stores every available E.C.A.I. agent.
    private let agents: [ECAIAgent] = [
        CustomerSuccessAgent(),
        QuoteIntelligenceAgent(),
        MarketingIntelligenceAgent(),
        ProjectIntelligenceAgent()
    ]
    // Returns every available E.C.A.I. agent.
    func allAgents() -> [ECAIAgent] {
        // Returns the complete agent collection.
        agents
    }
    // Searches for one agent by its exact display name.
    func agent(
        named name: String
    ) -> ECAIAgent? {
        // Returns the first agent whose name matches the request.
        agents.first {
            $0.name == name
        }
    }
    // Generates a response using the selected local E.C.A.I. agent.
    func generateResponse(
        using agentName: String,
        input: String
    ) async -> String {
        // Finds the requested local agent.
        guard let selectedAgent = agent(
            named: agentName
        ) else {
            // Explains that the selected agent could not be found.
            return "Agent not found."
        }
        // Runs the selected agent's existing task without Firebase or a paid service.
        return selectedAgent.generateResponse(
            from: input
        )
    }
}
