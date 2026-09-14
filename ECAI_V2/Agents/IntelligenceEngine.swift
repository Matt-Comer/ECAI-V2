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
// Connects E.C.A.I. to the live Gemini model.
    private let model = FirebaseAI
        .firebaseAI(backend: .googleAI())
        .generativeModel(modelName: "gemini-3.7-flash")
    // Returns every available E.C.A.I. agent.
    func allAgents() -> [ECAIAgent] {
        agents
    }
    // Searches  for one agent by its exact display name.
    func agent(named name: String) -> ECAIAgent? {
        agents.first {
            $0.name == name
        }
    }
    // Generates a live AI response using the  selected E.C.A.I. agent.
    func generateResponse(
        using agentName: String,
        input: String
    ) async -> String {
        // Finds the requested E.C.A.I. agent.
        guard let selectedAgent = agent(named: agentName) else {
            return "Agent not found."
        }
        // Gives Gemini the selected agents  role and the users request.
        let prompt = """
        You are the \(selectedAgent.name) inside Elite Contractor AI.

        Your role:
        \(selectedAgent.description)

        Create a clear, professional, and practical response for a contractor.

        User request:
        \(input)
        """
        do {
        // Sends the request to the live Gemini model.
            let result = try await model.generateContent(prompt)
        // Returns the live response when Gemini gives one.
            if let text = result.text, !text.isEmpty {
                return text
            }
        } catch {
            // Keeps E.C.A.I. working  if the internet or AI service is unavailable.
            return selectedAgent.generateResponse(from: input)
        }
        // Uses the local agent if Gemini returns  no text.
        return selectedAgent.generateResponse(from: input)
    }
}
