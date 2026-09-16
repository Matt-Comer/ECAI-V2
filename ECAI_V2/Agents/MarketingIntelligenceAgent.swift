//
//  MarketingIntelligenceAgent.swift
//  ECAI_V2
//
//  Created by Matthew Comer on 2026-07-14.
//
import Foundation
// Creates the E.C.A.I. agent responsible for marketing support.
struct MarketingIntelligenceAgent: ECAIAgent {
    // Stores the name displayed for this agent.
    let name = "Marketing Intelligence Agent"
    // Describes what this agent handles.
    let description = "Creates marketing campaigns, promotional ideas, social media content, and customer outreach."
    // Creates a marketing response from the information provided.
    func generateResponse(from input: String) -> String {
        // Removes extra spaces from the users input.
        let cleanedInput = input
            .replacingOccurrences(
                of: "Create a practical contractor marketing campaign using these details:",
                with: ""
            )
            .trimmingCharacters(in: .whitespacesAndNewlines)
        // Makes sure marketing information was entered.
        if cleanedInput.isEmpty {
            return """
            Please enter the service, target audience, location, and marketing goal.
            """
        }
        // Converts the input to lowercase for keyword matching.
        let service = cleanedInput.lowercased()
        // Finds the type of contractor service.
        let serviceType = findServiceType(service)
        // Gets the marketing details for the service.
        let details = marketingDetails(for: serviceType)
        // Builds and returns the marketing strategy.
        return buildMarketingStrategy(
            campaign: cleanedInput,
            type: serviceType,
            details: details
        )
    }
    // Finds the contractor service using keywords.
    private func findServiceType(_ service: String) -> String {
        // Checks for landscaping services.
        if containsAny(service, ["landscaping", "gardening", "lawn", "garden"]) {
            return "LANDSCAPING"
        }
        // Checks for concrete services
        if containsAny(service, ["concrete", "parging", "cement", "foundation"]) {
            return "CONCRETE"
        }
        // Checks for interlocking services.
        if containsAny(service, ["interlock", "paver", "patio", "walkway"]) {
            return "INTERLOCKING"
        }
        // Checks for painting services.
        if containsAny(service, ["painting", "paint", "painter"]) {
            return "PAINTING"
        }
        // Checks for carpentry services.
        if containsAny(service, ["carpentry", "deck", "stairs", "railing", "wood"]) {
            return "CARPENTRY"
        }
        // Checks for demolition services.
        if containsAny(service, ["demolition", "demo", "removal", "cleanup"]) {
            return "DEMOLITION AND REMOVAL"
        }
        // Uses general contractor when nothing matches.
        return "CONTRACTOR"
    }
    // Checks the description for matching keywords.
    private func containsAny(_ text: String, _ words: [String]) -> Bool {
        words.contains { text.contains($0) }
    }
    // Stores the sections used for the marketing response.
    private struct MarketingDetails {
        let customers: String
        let promotion: String
        let caption: String
        let callToAction: String
    }
    // Builds the final marketing strategy.
    private func buildMarketingStrategy(
        campaign: String,
        type: String,
        details: MarketingDetails
    ) -> String {
        // Returns all marketing sections in one response.
        return """
        \(type) MARKETING STRATEGY

        Campaign:
        \(campaign)

        Target customers:
        \(details.customers)

        Sales approach:
        Lead with the customer's problem and give them a clear reason to act now.

        Recommended promotion:
        \(details.promotion)

        Social media caption:
        \(details.caption)

        Follow-up:
        Follow serious leads quickly and look for related work that can be added to the job.

        Call to action:
        \(details.callToAction)
        """
    }
    // Returns the marketing details for each service.
    private func marketingDetails(for type: String) -> MarketingDetails {
        // Selects the correct contractor marketing information.
        switch type {
        // Creates the landscaping marketing details.
        case "LANDSCAPING":
            return MarketingDetails(
                customers: """
                • Homeowners with overgrown or outdated outdoor spaces
                • Property owners preparing for spring or summer
                • Landlords and property managers
                • Customers needing recurring maintenance
                """,
                promotion: """
                • Use before-and-after photos from completed jobs.
                • Promote seasonal cleanups and garden restoration.
                • Distribute flyers in neighbourhoods with mature properties.
                • Post completed projects in local Facebook groups.
                • Offer free on-site estimates.
                • Ask satisfied customers for referrals and online reviews.
                """,
                caption: """
                Transform your outdoor space with professional landscaping and garden services. Reliable work, clear communication, and quality results. Contact us today to arrange a free estimate.
                """,
                callToAction: "Book your landscaping estimate today."
            )
        // Creates the concrete marketing details.
        case "CONCRETE":
            return MarketingDetails(
                customers: """
                • Homeowners with cracked or damaged concrete
                • Owners of older Toronto properties
                • Customers needing stairs, walkways, or foundation repairs
                • Property managers and landlords
                """,
                promotion: """
                • Show close-up before-and-after repair photos.
                • Explain how early repairs can prevent larger damage.
                • Promote concrete stairs, parging, walkways, and repairs.
                • Distribute flyers near older homes and rental properties.
                • Post project progress videos and finished results.
                • Ask customers for reviews immediately after completion.
                """,
                caption: """
                Cracked concrete, damaged stairs, or failing parging? Professional repairs can restore the appearance and protect your property from further damage. Contact us for an on-site estimate.
                """,
                callToAction: "Schedule your concrete repair assessment."
            )
        // Creates the interlocking marketing details.
        case "INTERLOCKING":
            return MarketingDetails(
                customers: """
                • Homeowners upgrading patios and walkways
                • Customers with sinking or uneven pavers
                • Property owners improving curb appeal
                • Homeowners preparing to sell
                """,
                promotion: """
                • Use strong before-and-after project photos.
                • Show excavation, base preparation, and final installation.
                • Promote repairs as well as complete installations.
                • Target neighbourhoods with older interlocking.
                • Post short videos explaining proper installation.
                • Offer free measurements and written estimates.
                """,
                caption: """
                Upgrade your outdoor space with professionally installed interlocking. From excavation and base preparation to the final stone, every stage is completed with care. Contact us for a free estimate.
                """,
                callToAction: "Request your interlocking estimate today."
            )
        // Creates the painting marketing details.
        case "PAINTING":
            return MarketingDetails(
                customers: """
                • Homeowners updating interior spaces
                • Landlords preparing rental units
                • Customers preparing homes for sale
                • Small businesses needing fresh commercial spaces
                """,
                promotion: """
                • Use before-and-after room photos.
                • Showcase clean lines and detailed preparation.
                • Promote fast room refresh packages.
                • Advertise seasonal interior painting.
                • Connect with real estate agents and landlords.
                • Ask customers for reviews and referrals.
                """,
                caption: """
                Refresh your home with clean, professional painting services. Careful preparation, quality finishes, and reliable service from start to completion. Contact us today for an estimate.
                """,
                callToAction: "Book your painting estimate today."
            )
        // Creates the carpentry marketing details.
        case "CARPENTRY":
            return MarketingDetails(
                customers: """
                • Homeowners needing safe exterior stairs
                • Customers repairing decks and railings
                • Property owners replacing damaged wood
                • Landlords upgrading rental properties
                """,
                promotion: """
                • Show before-and-after photos of stairs and railings.
                • Highlight safety, strength, and functionality.
                • Promote repairs as a cost-effective alternative to replacement.
                • Target neighbourhoods with older porches and decks.
                • Post progress photos showing framing and finished work.
                • Offer on-site measurements and written estimates.
                """,
                caption: """
                Need new stairs, railings, deck repairs, or custom carpentry? Get dependable construction built for safety, strength, and long-term use. Contact us to arrange an estimate.
                """,
                callToAction: "Schedule your carpentry assessment."
            )
        // Creates the demolition marketing details.
        case "DEMOLITION AND REMOVAL":
            return MarketingDetails(
                customers: """
                • Homeowners beginning renovations
                • Contractors needing site preparation
                • Landlords clearing damaged materials
                • Customers removing old decks, concrete, or landscaping
                """,
                promotion: """
                • Show organized before-and-after cleanup photos.
                • Highlight safe removal and responsible disposal.
                • Promote small demolition services that larger companies avoid.
                • Connect with renovation contractors and property managers.
                • Advertise fast scheduling and clear pricing.
                • Post completed clean and empty work areas.
                """,
                caption: """
                Starting a renovation or removing an old structure? We provide reliable demolition, material removal, and site cleanup services. Contact us for an assessment and estimate.
                """,
                callToAction: "Arrange your demolition estimate today."
            )
        // Creates the general contractor marketing details.
        default:
            return MarketingDetails(
                customers: """
                • Homeowners needing reliable property improvements
                • Landlords and property managers
                • Customers preparing homes for sale
                • Previous clients who may need additional work
                """,
                promotion: """
                • Clearly explain the service and customer benefit.
                • Use before-and-after project photos.
                • Post consistently on social media.
                • Distribute flyers in selected neighbourhoods.
                • Offer on-site estimates.
                • Follow up with previous leads.
                • Ask satisfied customers for referrals and reviews.
                • Track where every new customer heard about the business.
                """,
                caption: """
                Professional contracting services with dependable communication, quality workmanship, and results you can trust. Contact us today to discuss your project and arrange an estimate.
                """,
                callToAction: "Contact us today to get your project started."
            )
        }
    }
}
