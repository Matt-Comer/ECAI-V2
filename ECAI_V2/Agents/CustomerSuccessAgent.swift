
//  CustomerSuccessAgent.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-10.
//
import Foundation
// Creates the E.C.A.I. agent responsible for customer communication.
struct CustomerSuccessAgent: ECAIAgent {
    // Stores the name displayed for this agent.
    let name = "Customer Success Agent"
    // Stores a short explanation of the agent's purpose.
    let description = "Creates professional customer follow-ups, reminders, and service messages."
// Creates a customer communication response from the information provided.
    func generateResponse(
        from input: String
    ) -> String {
        // Removes extra spaces from the  beginning and end of the input.
        let cleanedInput = input
            .replacingOccurrences(
                of: "Create a professional customer follow-up message using these details:",
                with: ""
            )
            .trimmingCharacters(in: .whitespacesAndNewlines)        // Checks whether the user entered customer information.
        if cleanedInput.isEmpty {
            return """
            Please enter the customer name, project details, and the type of message you need.
            """
        }
        // Converts the input to lowercase so the requested message type can be  identified.
        let lowercaseInput = cleanedInput.lowercased()
        // Creates an estimate follow-up  message.
        if lowercaseInput.contains("estimate") ||
            lowercaseInput.contains("quote") {
            return """
            Hello,
            I am following up regarding the estimate for \(cleanedInput).
            Please let me know if you have any questions about the scope of work, pricing, or scheduling. I would be happy to review the details with you and discuss the next steps.
            Thank you,
            E.C.A.I.
            Elite Contractor AI
            """
        }
    // Creates a payment reminder message.
        if lowercaseInput.contains("payment") ||
            lowercaseInput.contains("invoice") ||
            lowercaseInput.contains("balance") {
            return """
            Hello,
            This is a friendly reminder regarding the outstanding payment for \(cleanedInput).
            Please let me know if payment has already been sent or if you have any questions about the remaining balance.
            Thank you,
            E.C.A.I.
            Elite Contractor AI
            """
        }
    // Creates an appointment confirmation  message.
        if lowercaseInput.contains("appointment") ||
            lowercaseInput.contains("scheduled") ||
            lowercaseInput.contains("meeting") {
            return """
            Hello,
            I am confirming the scheduled appointment for \(cleanedInput).
            Please let me know if the date and time still work for you or if any changes are required.
            Thank you,
            E.C.A.I.
            Elite Contractor AI
            """
        }
        // Creates  a project update message.
        if lowercaseInput.contains("update") ||
            lowercaseInput.contains("progress") {
            return """
            Hello,
            I wanted to provide you with an update regarding \(cleanedInput).
            The project is moving forward, and I will continue to keep you informed as the work progresses. Please let me know if you have any questions.
            Thank you,
            E.C.A.I.
            Elite Contractor AI
            """
        }
        //  Creates a project completion message.
        if lowercaseInput.contains("complete") ||
            lowercaseInput.contains("finished") ||
            lowercaseInput.contains("done") {
            return """
            Hello,
            I am pleased to let you know that the work for \(cleanedInput) has been completed.
            Please take a moment to review the finished work and let me know if you have any questions or concerns.
            Thank you,
            E.C.A.I.
            Elite Contractor AI
            """
        }
        // Creates a customer review  request.
        if lowercaseInput.contains("review") {
            return """
            Hello,
            Thank you for choosing us for \(cleanedInput).
            If you were happy with the service, we would greatly appreciate it if you could leave a review. Your feedback helps support our business and allows us to continue improving.
            Thank you,
            E.C.A.I.
            Elite Contractor AI
            """
        }
        // Creates a general customer follow-up message when no specific message  type is found.
        return """
        Hello,
        I am following up regarding \(cleanedInput).
        Please let me know if you have any questions or if you would like to move forward. I would be happy to review the details with you and arrange the next step.
        Thank you,
        E.C.A.I.
        Elite Contractor AI
        """
    }
}
