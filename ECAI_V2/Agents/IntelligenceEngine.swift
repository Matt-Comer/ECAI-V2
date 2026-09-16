//
//  IntelligenceEngine.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-10.
//
//
import Foundation
import FirebaseAILogic
// Controls every E.C.A.I. intelligence agent.
final class IntelligenceEngine {
    // Stores every available E.C.A.I. agent.
    private let agents: [ECAIAgent] = [
        CustomerSuccessAgent(),
        QuoteIntelligenceAgent(),
        MarketingIntelligenceAgent(),
        ProjectIntelligenceAgent()
    ]
//  Connects E.C.A.I. to the live Gemini model.
    private let model = FirebaseAI
        .firebaseAI(backend: .googleAI())
        .generativeModel(modelName: "gemini-3.7-flash")
    // Returns every available E.C.A.I. agent.
    func allAgents() -> [ECAIAgent] {
        agents
    }
    //  Searches for one agent by its exact display name.
    func agent(named name: String) -> ECAIAgent? {
        agents.first {
            $0.name == name
        }
    }
    // Generates a response using the selected E.C.A.I. agent.
    func generateResponse(
        using agentName: String,
        input: String
    ) async -> String {
    // Finds the requested E.C.A.I. agent.
        guard let selectedAgent = agent(named: agentName) else {
            return "Agent not found."
        }
        // Uses the selected E.C.A.I. agent directly.
        return selectedAgent.generateResponse(from: input)
    }
}
