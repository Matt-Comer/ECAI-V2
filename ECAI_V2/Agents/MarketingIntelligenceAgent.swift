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
    // Stores a short explanation of the agent's purpose.
    let description = "Creates marketing campaigns, promotional ideas, social media content, and customer outreach."
    // Creates a marketing response from the information provided.
    func generateResponse(
        from input: String
    ) -> String {
        // Removes extra spaces from the beginning and end of the input.
        let cleanedInput = input.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        // Checks whether the user entered marketing information.
        if cleanedInput.isEmpty {
            return """
            Please enter the service, target audience, location, and marketing goal.
            Example:
            Promote my interlocking services to homeowners in Toronto.
            """
        }
        // Converts the input to lowercase so the service can be identified.
        let lowercaseInput = cleanedInput.lowercased()
        // Creates a marketing strategy for landscaping services.
        if lowercaseInput.contains("landscaping") ||
            lowercaseInput.contains("gardening") ||
            lowercaseInput.contains("lawn") ||
            lowercaseInput.contains("garden") {
            return """
            LANDSCAPING MARKETING STRATEGY
            Campaign:
            \(cleanedInput)
            Target customers:
            • Homeowners with overgrown or outdated outdoor spaces
            • Property owners preparing for spring or summer
            • Landlords and property managers
            • Customers needing recurring maintenance
            Recommended promotion:
            • Use before-and-after photos from completed jobs.
            • Promote seasonal cleanups and garden restoration.
            • Distribute flyers in neighbourhoods with mature properties.
            • Post completed projects in local Facebook groups.
            • Offer free on-site estimates.
            • Ask satisfied customers for referrals and online reviews.
            Social media caption:
            Transform your outdoor space with professional landscaping and garden services. Reliable work, clear communication, and quality results. Contact us today to arrange a free estimate.
            Call to action:
            Book your landscaping estimate today.
            """
        }
        // Creates a marketing strategy for concrete services.
        if lowercaseInput.contains("concrete") ||
            lowercaseInput.contains("parging") ||
            lowercaseInput.contains("cement") ||
            lowercaseInput.contains("foundation") {
            return """
            CONCRETE MARKETING STRATEGY
            Campaign:
            \(cleanedInput)
            Target customers:
            • Homeowners with cracked or damaged concrete
            • Owners of older Toronto properties
            • Customers needing stairs, walkways, or foundation repairs
            • Property managers and landlords
            Recommended promotion:
            • Show close-up before-and-after repair photos.
            • Explain how early repairs can prevent larger damage.
            • Promote concrete stairs, parging, walkways, and repairs.
            • Distribute flyers near older homes and rental properties.
            • Post project progress videos and finished results.
            • Ask customers for reviews immediately after completion.
            Social media caption:
            Cracked concrete, damaged stairs, or failing parging? Professional repairs can restore the appearance and protect your property from further damage. Contact us for an on-site estimate.
            Call to action:
            Schedule your concrete repair assessment.
            """
        }
        // Creates a marketing strategy for interlocking services.
        if lowercaseInput.contains("interlock") ||
            lowercaseInput.contains("paver") ||
            lowercaseInput.contains("patio") ||
            lowercaseInput.contains("walkway") {
            return """
            INTERLOCKING MARKETING STRATEGY
            Campaign:
            \(cleanedInput)
            Target customers:
            • Homeowners upgrading patios and walkways
            • Customers with sinking or uneven pavers
            • Property owners improving curb appeal
            • Homeowners preparing to sell
            Recommended promotion:
            • Use strong before-and-after project photos.
            • Show excavation, base preparation, and final installation.
            • Promote repairs as well as complete installations.
            • Target neighbourhoods with older interlocking.
            • Post short videos explaining proper installation.
            • Offer free measurements and written estimates.
            Social media caption:
            Upgrade your outdoor space with professionally installed interlocking. From excavation and base preparation to the final stone, every stage is completed with care. Contact us for a free estimate.
            Call to action:
            Request your interlocking estimate today.
            """
        }
        // Creates a marketing strategy for painting services.
        if lowercaseInput.contains("painting") ||
            lowercaseInput.contains("paint") ||
            lowercaseInput.contains("painter") {
            return """
            PAINTING MARKETING STRATEGY
            Campaign:
            \(cleanedInput)
            Target customers:
            • Homeowners updating interior spaces
            • Landlords preparing rental units
            • Customers preparing homes for sale
            • Small businesses needing fresh commercial spaces
            Recommended promotion:
            • Use before-and-after room photos.
            • Showcase clean lines and detailed preparation.
            • Promote fast room refresh packages.
            • Advertise seasonal interior painting.
            • Connect with real estate agents and landlords.
            • Ask customers for reviews and referrals.
            Social media caption:
            Refresh your home with clean, professional painting services. Careful preparation, quality finishes, and reliable service from start to completion. Contact us today for an estimate.
            Call to action:
            Book your painting estimate today.
            """
        }
        // Creates a marketing strategy for carpentry and deck services.
        if lowercaseInput.contains("carpentry") ||
            lowercaseInput.contains("deck") ||
            lowercaseInput.contains("stairs") ||
            lowercaseInput.contains("railing") ||
            lowercaseInput.contains("wood") {
            return """
            CARPENTRY MARKETING STRATEGY
            Campaign:
            \(cleanedInput)
            Target customers:
            • Homeowners needing safe exterior stairs
            • Customers repairing decks and railings
            • Property owners replacing damaged wood
            • Landlords upgrading rental properties
            Recommended promotion:
            • Show before-and-after photos of stairs and railings.
            • Highlight safety, strength, and functionality.
            • Promote repairs as a cost-effective alternative to replacement.
            • Target neighbourhoods with older porches and decks.
            • Post progress photos showing framing and finished work.
            • Offer on-site measurements and written estimates.
            Social media caption:
            Need new stairs, railings, deck repairs, or custom carpentry? Get dependable construction built for safety, strength, and long-term use. Contact us to arrange an estimate.
            Call to action:
            Schedule your carpentry assessment.
            """
        }
        // Creates a marketing strategy for demolition and cleanup services.
        if lowercaseInput.contains("demolition") ||
            lowercaseInput.contains("demo") ||
            lowercaseInput.contains("removal") ||
            lowercaseInput.contains("cleanup") {
            return """
            DEMOLITION AND REMOVAL MARKETING STRATEGY
            Campaign:
            \(cleanedInput)
            Target customers:
            • Homeowners beginning renovations
            • Contractors needing site preparation
            • Landlords clearing damaged materials
            • Customers removing old decks, concrete, or landscaping
            Recommended promotion:
            • Show organized before-and-after cleanup photos.
            • Highlight safe removal and responsible disposal.
            • Promote small demolition services that larger companies avoid.
            • Connect with renovation contractors and property managers.
            • Advertise fast scheduling and clear pricing.
            • Post completed clean and empty work areas.
            Social media caption:
            Starting a renovation or removing an old structure? We provide reliable demolition, material removal, and site cleanup services. Contact us for an assessment and estimate.
            Call to action:
            Arrange your demolition estimate today.
            """
        }
        // Creates a general contractor marketing strategy.
        return """
        CONTRACTOR MARKETING STRATEGY
        Campaign:
        \(cleanedInput)
        Target customers:
        • Homeowners needing reliable property improvements
        • Landlords and property managers
        • Customers preparing homes for sale
        • Previous clients who may need additional work
        Recommended promotion:
        • Clearly explain the service and customer benefit.
        • Use before-and-after project photos.
        • Post consistently on social media.
        • Distribute flyers in selected neighbourhoods.
        • Offer on-site estimates.
        • Follow up with previous leads.
        • Ask satisfied customers for referrals and reviews.
        • Track where every new customer heard about the business.
        Social media caption:
        Professional contracting services with dependable communication, quality workmanship, and results you can trust. Contact us today to discuss your project and arrange an estimate.
        Call to action:
        Contact us today to get your project started.
        """
    }
}
